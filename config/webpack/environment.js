const { environment } = require('@rails/webpacker')
var path = require('path');

const customConfig = {
  resolve: {
    alias: {
      core: path.join(__dirname, 'core'),
    },
    fallback: {
      dgram: false,
      fs: false,
      net: false,
      tls: false,
      child_process: false
    }
  }
};

environment.config.delete('node.dgram')
environment.config.delete('node.fs')
environment.config.delete('node.net')
environment.config.delete('node.tls')
environment.config.delete('node.child_process')

environment.config.merge(customConfig);

module.exports = environment
