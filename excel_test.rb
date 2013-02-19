#encoding : utf-8
require 'rubygems'
require 'roo'

book               = Roo::Excelx.new('d:/123.xlsx')
#book               = Roo::Excelx.new('lib/file/飞思达测试详细数据.xlsx')
book.default_sheet = book.sheets.first

2.upto(10) do |line|
  date        = book.cell(line, 'A')
  source_node = book.cell(line, 'B')

  puts "#{date}\t#{source_node}"
end


=begin
oo = Openoffice.new('lib/file/飞转达测试详细数据.xlsx')

2.upto(10) do |line|
  date       = oo.cell(line,'A')
  source_node = oo.cell(line,'B')

  puts "#{date}\t#{source_node}"
end
=end
