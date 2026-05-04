(function() {
  var VERSION;

  ({VERSION} = require('coffeescript'));

  exports.functions = {
    Version: function() {
      return VERSION;
    }
  };

}).call(this);
