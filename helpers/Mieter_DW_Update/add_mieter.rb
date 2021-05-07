#!/usr/bin/env ruby
# This program transforms a Mieter csv from karthago to let it mix with the old
# one from docuware

require 'csv'

# Getting the filename from Arguments
# if ARGV.size != 1 && ARGV.first != '--test'
#   STDERR.puts "Arguments needs to be 'filename' or  '--test filename'."
#   exit(1)
# end

# sets up testing for --test argument
if ARGV.first == '--test'
  file_name = ARGV[1]
  export_file_name = 'test.csv'
else
  dw_file_name = ARGV.first
  kt_file_name = ARGV[1]
  export_file_name = 'mieter_objekte.csv'
end

# Transform input into CSV Array
dw_csv = File.read(dw_file_name)
dw_array = CSV.parse(dw_csv, col_sep: ',')
kt_csv = File.read(kt_file_name)
kt_array = CSV.parse(kt_csv, col_sep: ';')

# separate header for later use
dw_header = dw_array.shift
kt_header = kt_array.shift

# Turn CSV Array into hash to merge duplicate obejct number data into subarrays
kt_array.reject! { |row| row.first.nil? }
kt_array.map! do |row|
  [row[0], row[2], row[1], "nicht angeben", row[3], row[6], "nicht angeben", "", "#{row[0]}.#{row[3]}"]
end

# Merge both arrays and sort
unsorted_array = dw_array + kt_array
unsorted_array.uniq! { |row| row.last }

sorted_array = unsorted_array.sort_by { |row| row.last }

array = [dw_header] + sorted_array

# Generate csv from array
csv_str = CSV.generate(col_sep: ',') do |csv|
  array.each { |row| csv << row }
end


File.write(export_file_name, csv_str)
