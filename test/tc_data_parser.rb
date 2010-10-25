require File.join(File.dirname(__FILE__), '../lib/data_parser')
require File.join(File.dirname(__FILE__), 'test_helper')
require "test/unit"

 
class TestDataParser < Test::Unit::TestCase

  def setup
    var=TestHelper::get_test_data
    nodes=[]
    data_parser = Assignment::DataParser.new(nodes)
  end

  def test_get_parsed_data_as_array
    result=data_parser.get_parsed_data_as_array
    assert_equal(1, result.length)
  end
end
