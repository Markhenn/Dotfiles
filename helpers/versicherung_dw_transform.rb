#!/usr/bin/env ruby
# This program reformats csv with Versicherungsdaten for DW

require 'csv'
COL_SEP = ';'

# Getting the filename from Arguments
if ARGV.size != 1 && ARGV.first != '--test'
  STDERR.puts "Arguments needs to be 'filename' or  '--test filename'."
  exit(1)
end

# sets up testing for --test argument
if ARGV.first == '--test'
  file_name = ARGV[1]
  export_file_name = 'test.csv'
else
  file_name = ARGV.first
  export_file_name = ARGV.first
end

# Transform input into CSV Array
csv = File.read(file_name)
array = CSV.parse(csv, col_sep: COL_SEP)

# separate header for later use
header = array.shift

# Find index of objectnumber
ob_idx = header.index { |ele| ele =~ /[oO]bj/ }
unless ob_idx
  STDERR.puts "The Column with Objektnummer must be named 'Objektnr'."
  exit(2)
end

# Turn CSV Array into hash to merge duplicate obejct number data into subarrays
csv_hsh = {}
array.each do |row|
  object = row[ob_idx]
  if csv_hsh.key? object
    csv_hsh[object] = csv_hsh[object].zip(row[1..-1])
  else
    csv_hsh[object] = row[1..-1]
  end
end

# join subarrays on || to have a single array per row
csv_hsh.each do |object, values|
  csv_hsh[object] = values.map do |elements|
    next elements unless elements.is_a? Array
    elements.uniq.join(' || ')
  end
end

# Turn hash in csv array again
csv_array = csv_hsh.to_a
csv_array.map! do |row|
  row.flatten
end

# add header on top
full_csv = [header] + csv_array

# Generate csv from array
csv_str = CSV.generate(col_sep: COL_SEP) do |csv|
  full_csv.each { |row| csv << row }
end


File.write(export_file_name, csv_str)
