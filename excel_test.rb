#encoding : utf-8
require 'rubygems'
require 'roo'
require 'set'

#book               = Roo::Excelx.new('d:/123.xlsx')
#book               = Roo::Excelx.new('lib/file/123.xlsx')
#book               = Roo::Excelx.new('lib/file/飞思达测试详细数据.xlsx')

book               = Roo::Excelx.new('lib/file/123.xlsx')
book.default_sheet = book.sheets.first
all_export         = Set.new

#book.last_row
2.upto(book.last_row) do |line|
  date                       = book.cell(line, 'A')
  source_node                = book.cell(line, 'B')
  source_node_arr            = book.cell(line, 'B').to_s.split(')')
  dest_node                  = book.cell(line, 'C')
  homepage_load_time         = book.cell(line, 'D')
  total_time                 = book.cell(line, 'E')
  throughput_rate            = book.cell(line, 'F')
  connect_success_rate       = book.cell(line, 'G')
  homepage_load_success_rate = book.cell(line, 'H')
  dest_host_ip               = book.cell(line, 'I')
  host_locale                = book.cell(line, 'J').to_s.split
  all_export.add source_node
  #提取骨干网数据分析。
  #todo:还需要对骨干网数据进行汇聚和分析
  if source_node == '广东铁通6-gddx(bgp)联通出口'
    int_locale = host_locale.to_s.split
    printf("%-20s|%-20s|%-10s|%-30s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|%-10s|%-10s\n", date, source_node_arr[0]+')', source_node_arr[1].chop.chop,
           dest_node, homepage_load_time, total_time, throughput_rate, connect_success_rate, homepage_load_success_rate, dest_host_ip, host_locale[0],
           host_locale[1])
  end

  #提取各种自租出口进行分析对比，只有出口同归属地对应的才算有效值
  #todo:此处未考虑骨干网数据
  if !source_node_arr[1].nil? && source_node_arr[1].chop.chop == host_locale[1]
    printf("%-20s|%-20s|%-10s|%-30s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|%-10s|%-10s\n", date, source_node_arr[0]+')', source_node_arr[1].chop.chop,
           dest_node, homepage_load_time, total_time, throughput_rate, connect_success_rate, homepage_load_success_rate, dest_host_ip,host_locale[0],
           host_locale[1])
  end

=begin
  printf("%-20s|%-30s|%-30s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|%-10s\n", date, source_node, dest_node, homepage_load_time, total_time,
         throughput_rate, connect_success_rate, homepage_load_success_rate, dest_host_ip, host_locale)

  puts "#{date}\t#{source_node}\t#{dest_node}\t#{homepage_load_time}\t#{total_time}\t#{throughput_rate}\t#{connect_success_rate}\t \
       #{homepage_load_success_rate}\t#{dest_host_ip}\t#{host_locale}"
=end
end

#all_export.each { |e| puts e }
#puts all_export.size

