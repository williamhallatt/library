import { S3 } from 'aws-sdk';

export namespace Bucket {

  export interface PrefixScope {
    Contents: S3.Object[];
    CommonPrefixes: S3.CommonPrefix[];
  }

  // Recursively build up a list of all object keys for the prefix provided via the ListObjectsV2Request
  export function listAllKeys(request: S3.Types.ListObjectsV2Request, keys: string[] = []): Promise<string[]> {
    return new Promise(async (resolve, reject) => {
      try {
        const scope = await listPrefix(request);
        const objectKeys = scope.Contents.map((object: S3.Object) => object.Key)
          .filter((key: string): key is string => key !== undefined);
        keys.push(...objectKeys);

        // Drill down into the "folders"
        for (const prefix of scope.CommonPrefixes) {
          const req: S3.Types.ListObjectsV2Request = { ...request };
          req.Prefix = prefix.Prefix;
          await listAllKeys(req, keys);
        }

        resolve(keys);
      } catch (error) {
        reject(error);
      }
    });
  }

  // Lists a single level of content (ie no "sub-directories") for the prefix provided via the ListObjectsV2Request
  // EXCLUDES PREFIXES (FOLDERS)
  export function listPrefix(request: S3.Types.ListObjectsV2Request,
    scope: PrefixScope = { Contents: [], CommonPrefixes: [] }): Promise<PrefixScope> {
    return new Promise<PrefixScope>(async (resolve, reject) => {
      try {
        const output: S3.Types.ListObjectsV2Output = await new S3()
          .listObjectsV2(request)
          .on('build', req => {
            req.httpRequest.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate';
            req.httpRequest.headers['Pragma'] = 'no-cache';
            req.httpRequest.headers['Expires'] = '-1';
          })
          .promise();

        output.Contents = output.Contents || [];
        output.CommonPrefixes = output.CommonPrefixes || [];

        // Filter the folders out of the listed S3 objects
        output.Contents = output.Contents.filter(el => el.Key !== request.Prefix);

        // Accumulate the S3 objects and common prefixes
        scope.Contents.push.apply(scope.Contents, output.Contents);
        scope.CommonPrefixes.push.apply(scope.CommonPrefixes, output.CommonPrefixes);

        // Retrieve >1000 objects
        if (output.IsTruncated) {
          request.ContinuationToken = output.NextContinuationToken;
          resolve(listPrefix(request, scope));
        } else {
          resolve(scope);
        }
      } catch (error) {
        reject(error);
      }
    });
  }
}
