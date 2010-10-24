require 'rubygems'
require 'nokogiri'

module Assignment
  class DataLoader
    def self.get_data
      path = '/Users/johanedlund/projects/assignment/resources/imac.html'
      doc = Nokogiri::HTML(File.open(path)) do |config|
        config.noblanks
      end
      
      # Search for nodes by xpath
      y = 0
      nodes = []
      doc.search('//table[@class=\'listing_thumbs\']/*').each do |a_tag|
        y = y + 1
        nodes << a_tag
      end
      nodes
    end
  end
end
