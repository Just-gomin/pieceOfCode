const path = require("path");

module.exports = {
  entry: "",
  output: {
    path: path.resolve(__dirname, "DISTRIBUTION_PATH"),
    filename: "FILE_NAME",
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        include: [],
        exclude: "/node_modules",
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"],
            plugin: ["@babel/plugin-proposal-class-properties"],
          },
        },
      },
    ],
  },
  devtool: "source-map",
  mode: "development",
};
