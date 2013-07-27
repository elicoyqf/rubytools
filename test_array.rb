#encoding : utf-8

str = '中国人民'
puts str[0]

cons_data = 'NULL'
odata = 'NULL'
type = 1
t_score = 0

if cons_data == 'NULL'
  if odata != 'NULL'
    t_score = 1
  end
else
  if odata == 'NULL'
    t_score = -1
  else
    case type
      when 1
        #越大越好
       puts '1--->'
      when 2
        #越小越好
       puts '2--->'
      else
    end
  end
end

puts t_score
