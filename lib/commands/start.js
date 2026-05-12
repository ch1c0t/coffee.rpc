(function() {
  var AUTH_TOKEN, SOCKET_PATH, TCP_HOST, TCP_PORT;

  ({SOCKET_PATH, TCP_HOST, TCP_PORT, AUTH_TOKEN} = process.env);

  exports.start = function() {
    var FindUser, Server, functions, port, printHelp, server;
    if (!((SOCKET_PATH != null) || (TCP_HOST != null))) {
      ({printHelp} = require('./help'));
      printHelp();
      process.exit();
    }
    require('@ch1c0t/ext');
    ({Server} = require('hobby-rpc.server'));
    ({functions} = require('../functions'));
    if (AUTH_TOKEN != null) {
      FindUser = function(token) {
        if (token === AUTH_TOKEN) {
          return "a string to test that auth works";
        }
      };
    }
    server = Server({functions, FindUser});
    if (SOCKET_PATH != null) {
      server.listen(SOCKET_PATH, function() {
        return p(`Listening on ${SOCKET_PATH}`);
      });
    }
    if (TCP_HOST != null) {
      port = TCP_PORT || 0;
      return server.listen(port, TCP_HOST, function() {
        var host;
        host = server.address().address;
        port = server.address().port;
        return p(`Listening on http://${host}:${port}`);
      });
    }
  };

}).call(this);
