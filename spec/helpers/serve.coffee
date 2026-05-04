{ randomUUID } = require 'crypto'
{ spawn } = require 'child_process'
{ once } = require 'events'

global.serve = ->
  socket = "#{TE.dir}/#{randomUUID()}.socket"

  cli = spawn TE.cli, [],
    env:
      SOCKET_PATH: socket
  TE.tasks.push cli

  new Promise (resolve, reject) ->
    data = await once cli.stdout, 'data'
    string = data.toString()
    if string.startsWith 'Listening on'
      resolve {
        socket
        pid: cli.pid
      }
    else
      reject string
