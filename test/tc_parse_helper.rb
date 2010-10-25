# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), '../lib/parse_helper')
require "test/unit"
 
class TestParseHelper < Test::Unit::TestCase
 
  def test_get_current_year
    year = Assignment::ParseHelper.get_current_year
    assert_instance_of(Fixnum, year)
  end

  def test_get_previous_year
    year = Assignment::ParseHelper.get_previous_year
    assert_instance_of(Fixnum, year)
  end

  def test_convert_to_utf8
    result = Assignment::ParseHelper.convert_to_utf8("åäösdf")
    assert_not_nil(result) #not sure how to test properly
  end

  def test_get_date_as_string
    time = Time.parse("2010-03-03 20:21")
    result = Assignment::ParseHelper.get_date_as_string(time)
    assert_equal("2010-3-3", result)
  end

  def test_get_time_as_string
    date_str="adasasd 12:14 dsfdsd"
    result = Assignment::ParseHelper.get_time_as_string(date_str)
    assert_equal("12:14", result)

    date_str="adasasd12:14dsfdsd"
    result = Assignment::ParseHelper.get_time_as_string(date_str)
    assert_equal("12:14", result)

    date_str="01:14"
    result = Assignment::ParseHelper.get_time_as_string(date_str)
    assert_equal("01:14", result)
  end

  def test_get_month
    month="jan"
    result=Assignment::ParseHelper.get_month(month)
    assert_equal("01", result)

    month="olle"
    result=Assignment::ParseHelper.get_month(month)
    assert_nil(result)
  end

  def test_calculate_year
    day="03"
    month="3"
    result=Assignment::ParseHelper.calculate_year(day, month)
    assert_instance_of(Fixnum, result)

    # test bad indata
    # todo: validate in method
    assert_raises ArgumentError do
      day="03"
      month="34"
      result=Assignment::ParseHelper.calculate_year(day, month)
    end
    
    assert_raises NameError do
      day=Nil
      month="3"
      result=Assignment::ParseHelper.calculate_year(day, month)
    end

    assert_raises ArgumentError do
      day="155"
      month="3"
      result=Assignment::ParseHelper.calculate_year(day, month)
    end

    assert_raises NameError do
      day="03"
      month=Nil
      result=Assignment::ParseHelper.calculate_year(day, month)
    end

  end


end
