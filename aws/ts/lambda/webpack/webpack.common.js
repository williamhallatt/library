const path = require('path');
const glob = require('glob');

const entryArray = glob.sync('lambdas/**/*.ts', {
  ignore: 'lambdas/**/*spec.ts'
});

const entryObject = entryArray.reduce((acc, fpath) => {
  const name = path.basename(fpath, path.extname(fpath))
  acc[name] = fpath.replace('lambdas', './lambdas');
  return acc;
}, {});

module.exports = {
  entry: entryObject,
  target: 'node',
  node: {
    __dirname: false
  },
  module: {
    rules: [{
      test: /\.tsx?$/,
      use: {
        loader: 'ts-loader',
        options: {
          configFile: 'tsconfig.lambda.json'
        }
      },
      exclude: /node_modules/
    }]
  },
  resolve: {
    extensions: ['.tsx', '.ts', '.js']
  },
  output: {
    filename: '[name]/[name].js',
    path: path.resolve(__dirname, './build/lambdas'),
    libraryTarget: 'commonjs'
  },
  externals: {
    'aws-sdk': 'aws-sdk'
  }
};
