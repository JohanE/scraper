# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), 'lib/data_loader')
require 'lib/data_parser'


#loader = Assignment::DataLoader.new
nodes = Assignment::DataLoader.get_data

puts "size of list = " + nodes.length.to_s + " nodes="+nodes.class.to_s

data_parser = Assignment::DataParser.new(nodes)
data_parser.get_parsed_nodes






