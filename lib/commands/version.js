(function() {
  var printVersion, version;

  ({version} = require('../../package.json'));

  printVersion = function() {
    return console.log(version);
  };

  module.exports = {printVersion, version};

}).call(this);
