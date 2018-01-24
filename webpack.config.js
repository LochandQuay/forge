module.exports = {
  entry: '.frontend/forge.js',
  output: {
    path: './app/assets/javascripts',
    filename: 'bundle.js'
  }, 
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: 'babel',
        query: {
          presets: ['env', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['', '.js', '.jsx']
  }
};