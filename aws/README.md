# AWS

IaC templates, wrappers and utilities building on the AWS CLI and SDKs

## Structure

* `tslint.json` - my preferred "go-to" linting rules
* `tsconfig.json` - configured to comply with the [AWS Lambda Node Runtimes](https://docs.aws.amazon.com/lambda/latest/dg/programming-model.html)

The `compile` script in `package.json` will build all `*.ts` files in all sub-directories. __HOWEVER__, in order to correctly bundle code
for AWS lambda, you'll have to use webpack/your packaging tool of choice (`webpack` config provided). Using the `webpack`
configuration as provided will iterate over directories in the `lambda` subdir and create individual named `lambda.js` files in the `build/lambda`
folder as you go.

In other words, if your structure is this before compiling (where `dostuff.ts` and `dootherstuff.ts` are two separate lambdas)

```bash
lambda
 - dostuff
  * dostuff.ts
 - dootherstuff
  * dootherstuff.ts
```

the `compile:webpack` build script will create the following output (based on the configuration in this repository)

```bash
build/lambda
 - dostuff
  * dostuff.js
 - dootherstuff
  * dootherstuff.js
```
