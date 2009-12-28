require 'test_helper'

class FuguTest < Test::Unit::TestCase
  def setup
    @fugu = Fugu.new
  end
  
  should "puff a string like {1-3}" do
    assert_equal %w[1 2 3], @fugu.puff_expression("1-3")
  end

  should "shrink a string like 1,2,3" do
    assert_equal "1-3", @fugu.shrink_array(%w[1 2 3])
  end
  
  should "pad expression with appropriate number of zeros" do
    assert_equal "01-10", @fugu.pad_expression("1-10")
  end
end
