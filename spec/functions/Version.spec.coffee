{ RPC } = require 'hobby-rpc.client'

describe 'Version', ->
  describe 'without Authentication', ->
    beforeEach ->
      { socket } = await serve 'unix_socket'
      @rpc = RPC { socket }

    it 'returns the CoffeeScript version', ->
      string = await @rpc 'Version'
      expect(string).toBe '2.7.0'

  describe 'with Authentication', ->
    it 'rejects if an invalid token was passed', ->
      { socket } = await serve 'unix_socket_with_authentication'
      @rpc = RPC { socket, token: 'invalid_token' }

      await expectAsync(@rpc 'Version').toBeRejectedWith 403

    it 'responds if a valid token was passed', ->
      { socket, token } = await serve 'unix_socket_with_authentication'
      @rpc = RPC { socket, token }

      string = await @rpc 'Version'
      expect(string).toBe '2.7.0'

      string = await @rpc 'User'
      expect(string).toBe "a string to test that auth works"
