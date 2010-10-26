# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), '../lib/data_parser')
require File.join(File.dirname(__FILE__), '../lib/data_loader')
require "test/unit"

 
class TestDataParser < Test::Unit::TestCase

  def setup
    # set test data into the parser
    nodes = Assignment::DataLoader.get_node_array_test
    @data_parser = Assignment::DataParser.new(nodes)
  end

  def test_get_subject_and_price
    node_data="En fin imac                 995:-"
    subject_result,price_result=@data_parser.get_subject_and_price(node_data)
    assert_instance_of(String, subject_result)
    assert_instance_of(Fixnum, price_result)

    # no bunch of whitespace in string, assume its only a subject
    node_data="En fin imac 995:-"
    subject_result,price_result=@data_parser.get_subject_and_price(node_data)
    assert_equal(node_data, subject_result)
    assert_equal(-1, price_result)

    node_data=""
    subject_result,price_result=@data_parser.get_subject_and_price(node_data)
    assert_equal("", subject_result)
    assert_equal(-1, price_result)

  end

  def test_extract_time
    date_str="Idag<br>16:15"
    result=@data_parser.extract_time(date_str)
    assert_instance_of(Time, result)

    date_str="Igår<br>22:55"
    result=@data_parser.extract_time(date_str)
    assert_instance_of(Time, result)

    date_str="25 jan 21:59"
    result=@data_parser.extract_time(date_str)
    assert_instance_of(Time, result)

    date_str=""
    result=@data_parser.extract_time(date_str)
    assert_nil(result)

    date_str="sdfsd42332342wer"
    result=@data_parser.extract_time(date_str)
    assert_nil(result)
  end

  def test_get_parsed_data_as_array
    result=@data_parser.get_parsed_data_as_array
    # check that result size matches the test data
    assert_equal(5, result.length)

    node_result=result[0]
    # check correct types
    assert_instance_of(Time, node_result[0])
    assert_instance_of(String, node_result[1])
    assert_instance_of(Fixnum, node_result[2])
  end
end
