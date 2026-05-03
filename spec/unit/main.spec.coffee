{ version } = require 'coffee.rpc'

describe 'main', ->
  it 'returns the package version', ->
    expect(version).toBe '0.0.0'