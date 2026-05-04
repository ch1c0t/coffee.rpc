{ RPC } = require 'hobby-rpc.client'

describe 'Version', ->
  beforeEach ->
    @server = await serve 'unix_socket'
    @rpc = RPC { socket: @server.socket }

  it 'returns the CoffeeScript version', ->
    string = await @rpc 'Version'
    expect(string).toBe '2.7.0'
