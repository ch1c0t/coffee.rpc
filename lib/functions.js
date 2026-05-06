(function() {
  var VERSION, compile;

  ({VERSION, compile} = require('coffeescript'));

  exports.functions = {
    Version: function() {
      return VERSION;
    },
    Compile: f({
      in: {
        code: String,
        bare: Boolean
      },
      out: function() {
        return compile(this.code, this.props);
      }
    })
  };

}).call(this);
