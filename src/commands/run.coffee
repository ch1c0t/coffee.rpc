{
  SOCKET_PATH
} = process.env

exports.run = ->
  if SOCKET_PATH?
    require '@ch1c0t/ext'
    { Server } = require 'hobby-rpc.server'
    { functions } = require '../functions'

    server = Server {
      functions
    }

    server.listen SOCKET_PATH, ->
      p "Listening on #{SOCKET_PATH}"
  else
    { printHelp } = require './help'
    printHelp()
