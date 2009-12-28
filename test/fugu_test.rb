require 'test_helper'

class FuguTest < Test::Unit::TestCase
  def setup
    @fugu = Fugu.new
  end
  
  should "puff a string like {1-3}" do
    assert_equal %w[1 2 3], @fugu.puff_expression("{1-3}")
  end
end
