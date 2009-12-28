require 'test_helper'

class FuguTest < Test::Unit::TestCase
  def setup
    @fugu = Fugu.new
  end
  
  should "puff a string like {1-3}" do
    assert_equal %w[1 2 3], @fugu.puff_expression("{1-3}")
  end

  should "shrink a string like 1,2,3" do
    assert_equal "{1-3}", @fugu.shrink("1,2,3")
  end
end
