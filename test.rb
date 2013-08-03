#encoding : utf-8
require 'net/http'
require 'uri'
require 'json'
require 'iconv'

url = "http://localhost?world=李宁"

url = URI::encode(url)
puts url

#rurl = "http://localhost?world=%C0%EE%C4%FE"
rurl = "http://localhost?world=李宁"
rurl = URI::encode(rurl,'utf-8')

puts rurl
#contact=%C0%EE%C4%FE&contactinfo=10050&MACADDR=08-00-27-00-9C-11&ver=2.0.3&memo=%B5%E7%D0%C5%D3%C3%BB%A7

puts URI::encode('李宁','gbk')
#puts { :q =>'李宁'}.to_query


puts URI::encode(Iconv.conv("GBK","UTF-8","李宁"))
puts URI::encode(Iconv.conv("GBK","UTF-8","10050"))
puts URI::encode(Iconv.conv("GBK","UTF-8","铁通gpon用户"))

puts URI::encode("李宁".encode 'GBK', 'UTF-8')
puts "李宁".encode 'UTF-8', 'GBK'