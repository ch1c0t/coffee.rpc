exports.run = ->
  [_node, _program, command] = process.argv

  switch command
    when 'version', '--version', '-v'
      { printVersion } = require './commands/version'
      printVersion()
    when 'help'
      { printHelp } = require './commands/help'
      printHelp()
    else
      { run } = require './commands/run'
      run()
