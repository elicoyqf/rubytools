require 'set'

def newpass(len, prefix='')
  chars   = ("a".."z").to_a + ("0".."9").to_a
  newpass = prefix.dup
  1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
  newpass
end

def ont_make(port, pass_prefix, lineid, srvid,count)
  pass_set = Set[]
  (1..count).each { |x| pass_set << newpass(3, pass_prefix) }
  if pass_set.size == count
    pass_set.each { |s| puts s }
  end

  if pass_set.size == count
    pass_set.each_with_index do |set, index|
      t   = index + 64
      tmp =''
      if t < 100
        tmp = t.to_s.ljust(3)
      else
        tmp = t
      end
      puts "ont add #{port} #{tmp} password-auth #{set} once-on no-aging omci ont-lineprofile-id #{lineid} ont-srvprofile-id #{srvid}"
    end
  end
end

def service_port_make(pvlan, portinfo, cvlan,count)
  (1..count).each do |index|
    t   = index + 63
    tmp =''
    if t < 100
      tmp = t.to_s.ljust(3)
    else
      tmp = t
    end
    puts "service-port vlan #{pvlan} port #{portinfo} ont #{tmp} eth 1 multi-service user-vlan untagged tag-transform add-double inner-vlan #{cvlan+index-1} inner-priority 0"
  end
end

ont_make(1, 'gd10061', 3, 3,64)
service_port_make(1314, '0/6/1', 1513,64)

