{ spawn } = require 'child_process'
{ once } = require 'events'

describe 'CLI start', ->
  it 'starts listening on Unix socket', ->
    socket = "#{TE.dir}/socket"
    cli = spawn TE.cli, [],
      env:
        SOCKET_PATH: socket
    TE.tasks.push cli

    data = await once cli.stdout, 'data'
    expect(data.toString())
      .toStartWith "Listening on #{socket}"

  it 'starts listening on TCP socket', ->
    host = '127.0.0.1'
    port = 8080
    cli = spawn TE.cli, [],
      env:
        TCP_HOST: host
        TCP_PORT: port
    TE.tasks.push cli

    data = await once cli.stdout, 'data'
    expect(data.toString())
      .toStartWith "Listening on http://#{host}:#{port}"
