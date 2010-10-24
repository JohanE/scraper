require 'rubygems'
require 'nokogiri'

module Assignment
  class DataLoader
    def self.get_data
      path = File.expand_path(File.dirname(__FILE__) + '/../resources/imac.html')
      # create a Nokogiri document
      doc = Nokogiri::HTML(File.open(path)) do |config|
        config.noblanks
      end
      
      # Search for nodes using xpath
      nodes = []
      doc.search('//table[@class=\'listing_thumbs\']/*').each do |a_tag|
        nodes << a_tag
      end
      nodes
    end
  end
end
