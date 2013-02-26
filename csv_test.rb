#encoding : utf-8
require 'csv'

#通过添加指定编码进行转换成utf-8进行读取数据。
i = 0
CSV.foreach('lib/file/HTTP_201302262200.csv',encoding: "GB2312:UTF-8",headers: true) do |row|
  puts row
  #puts '-'*80+'>>'
  i += 1
end
puts "i is -------->#{i}"

#其实是二维数据直接进行读取也可行。
data = CSV.read('lib/file/HTTP_201302262200.csv',encoding: 'GB2312:UTF-8')
puts data[1][1]

#CSV.open('lib/file/HTTP_201302262200.csv',"r:Unicode:UTF-8").each do | line |
#  puts line
#end


