# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), 'lib/data_loader')
require 'lib/data_parser'
require 'pp'

#loader = Assignment::DataLoader.new
nodes = Assignment::DataLoader.get_data

puts "size of list = " + nodes.length.to_s + " nodes="+nodes.class.to_s

data_parser = Assignment::DataParser.new(nodes)
parsed_data_array=data_parser.get_parsed_nodes

pp(parsed_data_array)
#puts parsed_data_array.inspect






