require File.join(File.dirname(__FILE__), '../lib/data_loader')
require "test/unit"
 
class TestDataLoader < Test::Unit::TestCase
 
  def test_get_node_array
    result = Assignment::DataLoader.get_node_array
    assert_instance_of(Array, result)
    assert_equal(49, result.length)
  end

end
