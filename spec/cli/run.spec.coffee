{ spawn } = require 'child_process'
{ once } = require 'events'

describe 'CLI run', ->
  it 'starts listening', ->
    socket = "#{TE.dir}/socket"
    cli = spawn TE.cli, [],
      env:
        SOCKET_PATH: socket
    TE.tasks.push cli

    data = await once cli.stdout, 'data'
    expect(data.toString())
      .toStartWith "Listening on #{socket}"
