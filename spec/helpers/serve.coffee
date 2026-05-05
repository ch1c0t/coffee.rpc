{ randomUUID } = require 'crypto'
{ spawn } = require 'child_process'
{ once } = require 'events'

global.serve = (input) ->
  switch input
    when 'unix_socket'
      socket = "#{TE.dir}/#{randomUUID()}.socket"
      env =
        SOCKET_PATH: socket
    when 'tcp_socket'
      env =
        TCP_HOST: '127.0.0.1'
        TCP_PORT: 0
    else
      { env } = input

  cli = spawn TE.cli, [], { env }
  TE.tasks.push cli
  AtExit ->
    try
      process.kill cli.pid
    catch error
      unless error.code is 'ESRCH'
        console.error error

  new Promise (resolve, reject) ->
    data = await once cli.stdout, 'data'
    string = data.toString()
    if string.startsWith 'Listening on'
      url = string.split(' ')[2]
      resolve {
        url
        socket
        pid: cli.pid
        cli: cli
        message: string
      }
    else
      reject string
