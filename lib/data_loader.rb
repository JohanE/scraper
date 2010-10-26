require 'rubygems'
require 'nokogiri'

module Assignment
  class DataLoader
    
    @xpath_expression='//table[@class=\'listing_thumbs\']/*'

    def self.get_node_array
      path = File.expand_path(File.dirname(__FILE__) + '/../resources/imac.html')
      # create a Nokogiri document
      @doc = Nokogiri::HTML(File.open(path)) do |config|
        config.noblanks
      end
      
      nodes = get_nodes(@xpath_expression)
    end

    def self.get_node_array_test
      path = File.expand_path(File.dirname(__FILE__) + '/../test/test_data.html')
      @doc = Nokogiri::HTML(File.open(path)) do |config|
        config.noblanks
      end
      nodes = get_nodes(@xpath_expression)
    end

    # Search for nodes using xpath
    def self.get_nodes(xpath_expression)
      nodes = []
      @doc.search(xpath_expression).each do |a_tag|
        nodes << a_tag
      end
      nodes
    end
  end
end
