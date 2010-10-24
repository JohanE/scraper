require 'time'
require File.join(File.dirname(__FILE__), 'parse_helper')

module Assignment
  class DataParser   

    attr_reader :nodes

    def initialize(nodes)
      @nodes = nodes
    end

    def get_subject_and_price (node_data)    
      subject, price = extract_subject_and_price_from_node(node_data)
      # convert the subjet to utf-8
      subject=Assignment::ParseHelper.convert_to_utf8(subject)
    
      # remove junk from the price
      price.gsub! /:-/, ''
      price.gsub! /\s+/, ''
    
      # make price into an Integer, if it fails assign the value -1
      begin
        price = Integer(price)
      rescue ArgumentError
        price = Integer(-1)
      end
      return subject, price
    end
       
    def process_date(date_str)
      if ( date_str =~ /Idag/i )
        date = Assignment::ParseHelper.get_date_as_string(Time.now) 
        time = Assignment::ParseHelper.get_time_as_string(date_str)
        parsed_time = Time.parse("#{date} #{time}:00") 
      elsif ( date_str =~ /Ig.*r/i )
        date = Assignment::ParseHelper.get_date_as_string(Time.now - (24 * 60 * 60)) 
        time =  Assignment::ParseHelper.get_time_as_string(date_str)
        parsed_time = Time.parse("#{date} #{time}:00") 
      elsif (date_str =~ /(\d+) (\w{3}) (.*)/)
        day = $1
        month=Assignment::ParseHelper.get_month($2)
        year=Assignment::ParseHelper.calculate_year(day, month)
        time= Assignment::ParseHelper.get_time_as_string($3)
        parsed_time = Time.parse("#{year}-#{month}-#{day} #{time}") 
      end
      parsed_time
    end

    def get_parsed_nodes
      # loop through the node array and parse through it
      nodes.length.times do |i|
        node = nodes[i]
        the_date = node.at('th').inner_html.strip
        # clean the date
        the_date.gsub! /<br>/, ' '
        parsed_time = process_date(the_date)
        puts "The date = " + the_date #text
        puts "Parsed time = " + parsed_time.to_s
        item_data = node.at('td.thumbs_subject').text.strip
        subject, price = get_subject_and_price(item_data)      
        puts "new price = " + price.to_s
        puts "subject = " + subject 
        puts ".....................--------------------------------"
      end
    end

    private

    def extract_subject_and_price_from_node(node_data)
      str_arr = node_data.split(/\s{3,}/) 
      if str_arr.length > 1
        subject = str_arr[0]
        price = str_arr[1]
      elsif str_arr.length == 1
        subject = str_arr[0]
        price = ''
      else
        subject = ''
        price = ''
      end
      return subject, price
    end

  end
end
