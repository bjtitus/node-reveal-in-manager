path = require('path')
reveal = require('../')

describe 'open', ->
  sampleFile = path.join(__dirname, 'sampleFile.txt');

  it 'should open sample file', (done) ->
    reveal sampleFile, done
