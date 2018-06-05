def fibs num
  b1 = 0
  b2 = 1
  puts b1
  puts b2
  num.times {
    tmp = b2
    b2 += b1
    b1 = tmp
    puts b2
  }
end

def fibs_rec num, l=[0,1]
  if l.length == num
    return l
  else
    return fibs_rec num, l<<l[-1]+l[-2]
  end
end