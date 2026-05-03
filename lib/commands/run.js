(function() {
  var SOCKET_PATH;

  ({SOCKET_PATH} = process.env);

  exports.run = function() {
    var Server, functions, printHelp, server;
    if (SOCKET_PATH != null) {
      require('@ch1c0t/ext');
      ({Server} = require('hobby-rpc.server'));
      ({functions} = require('../functions'));
      server = Server({functions});
      return server.listen(SOCKET_PATH, function() {
        return p(`Listening on ${SOCKET_PATH}`);
      });
    } else {
      ({printHelp} = require('./help'));
      return printHelp();
    }
  };

}).call(this);
