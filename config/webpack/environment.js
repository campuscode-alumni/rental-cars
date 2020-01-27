const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')

environment.loaders.prepend('erb', erb)
module.exports = environment

const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
