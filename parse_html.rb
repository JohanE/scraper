# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), 'lib/data_loader')
require 'lib/data_parser'
require 'pp'

nodes = Assignment::DataLoader.get_node_array

data_parser = Assignment::DataParser.new(nodes)
parsed_data_array=data_parser.get_parsed_data_as_array
pp(parsed_data_array)





