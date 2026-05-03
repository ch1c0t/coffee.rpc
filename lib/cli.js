(function() {
  exports.run = function() {
    var _node, _program, command, printHelp, printVersion, start;
    [_node, _program, command] = process.argv;
    switch (command) {
      case 'version':
      case '--version':
      case '-v':
        ({printVersion} = require('./commands/version'));
        return printVersion();
      case 'help':
        ({printHelp} = require('./commands/help'));
        return printHelp();
      default:
        ({start} = require('./commands/start'));
        return start();
    }
  };

}).call(this);
