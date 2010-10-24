# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), 'lib/data_loader')
require 'lib/data_parser'


loader = Assignment::DataLoader.new
nodes = loader.get_data

puts "size of list = " + nodes.length.to_s + " nodes="+nodes.class.to_s

data_parser = Assignment::DataParser.new

# loop through the node array and parse through it
nodes.length.times do |i|
  data_parser.process_node nodes[i]
end





