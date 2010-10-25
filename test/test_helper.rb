require 'rubygems'
require 'nokogiri'

class TestHelper
  def self.get_test_data
    
    path = File.expand_path(File.dirname(__FILE__) + '/test_data.html')


    # create a Nokogiri document
    doc = Nokogiri::HTML(File.open(path)) do |config|
      config.noblanks
    end
      
    # Search for nodes using xpath
    nodes = []
    doc.search('//table[@class=\'listing_thumbs\']/*').each do |a_tag|
    #doc.search('//table').each do |a_tag|
      nodes << a_tag
    end
    puts "size of array = "+ nodes.length.to_s
    nodes
  end
end
