# Webpack

This configuration provides examples on how to compile and bundle TS Lambdas using `webpack`

## Structure

* `tsconfig.lambda.json` - configured to comply with the [AWS Lambda Node Runtimes](https://docs.aws.amazon.com/lambda/latest/dg/programming-model.html)

Using the `webpack` configuration as provided will iterate over directories in the `lambdas` subdir and create individual named `lambda.js` files in the `build/lambdas`
folder as you go.

In other words, if your structure is this before compiling (where `dostuff.ts` and `dootherstuff.ts` are two separate lambdas)

```bash
lambda
 - dostuff
  * dostuff.ts
 - dootherstuff
  * dootherstuff.ts
```

the `compile:x` build scripts will create the following output (based on the configuration in this repository)

```bash
build/lambda
 - dostuff
  * dostuff.js
 - dootherstuff
  * dootherstuff.js
```
