$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'fugu'

require 'test/unit/assertions'
require 'matchy'

World(Test::Unit::Assertions)
