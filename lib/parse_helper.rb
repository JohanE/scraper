require 'time'
require 'iconv'

module Assignment
  class ParseHelper

    def self.convert_to_utf8(the_string)
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      converted_string = ic.iconv(the_string)
    end

    def self.get_current_year
      Time.now.year
    end

    def self.get_previous_year
      year = Time.now.year
      year-=1
    end

    def self.get_time_as_string (date_str)
      /(\d\d):(\d\d)/ =~ date_str
      "#{$1}:#{$2}"
    end

    def self.get_date_as_string (time_var)
      "#{time_var.year}-#{time_var.month}-#{time_var.day}"
    end

    def self.get_month(month_str)
      month_numerical = case month_str
                        when "jan" then "01"
                        when "feb" then "02"
                        when "mar" then "03"
                        when "apr" then "04"
                        when "maj" then "05"
                        when "jun" then "06"
                        when "jul" then "07"
                        when "aug" then "08"
                        when "sep" then "09"
                        when "okt" then "10"
                        when "nov" then "11"
                        when "dec" then "12"
                        end
    end      
  
    def self.calculate_year(day, month)
      if (is_date_from_last_year?(day, month))
        year=Assignment::ParseHelper.get_previous_year
      else
        year=Assignment::ParseHelper.get_current_year
      end
    end

    private

    def self.is_date_from_last_year?(day, month)
      current_year = Assignment::ParseHelper.get_current_year
      comparing_time = Time.parse("#{current_year}-#{month}-#{day}")
      Time.now < comparing_time
    end

  end
end
