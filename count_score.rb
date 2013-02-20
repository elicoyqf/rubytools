#encoding : utf-8
gg_data = Array.new() { Array.new() }

#读取时指定读取的编码为utf-8
File.open('lib/file/骨干出口有效数据.txt', 'r:utf-8') do |file|
  file.each_line do |line|
    tmp_arr = line.to_s.split('|')
    gg_data << tmp_arr
  end
  file.close()
end

zz_data = Array.new() { Array.new() }
File.open('lib/file/自租有效数据.txt', 'r:utf-8') do |file|
  file.each_line do |line|
    tmp_arr = line.to_s.split('|')
    zz_data << tmp_arr
  end
  file.close()
end

zz_data.each do |ll|
  gg_o_data = []
  gg_data.each do |g|
    if g[3]== ll[3]
      gg_o_data << g
    end
  end

  #4,5,6,7,8进行比较
  score = 0
  unless gg_o_data.empty?
    if ll[4].to_i >= gg_o_data[0][4].to_i*2
      score -= 1
    end

    if ll[5].to_i >= gg_o_data[0][5].to_i*2
      score -= 1
    end

    if ll[6].to_i >= gg_o_data[0][6].to_i*2
      score -= 1
    end

    if ll[7].to_i >= gg_o_data[0][7].to_i*2
      score -= 1
    end
  end
  if score != 0
    puts ll[1]+'-'*8+ll[2]+'-'*8+ll[3].to_s+'-'*8+'>'+score.to_s
  end
end


