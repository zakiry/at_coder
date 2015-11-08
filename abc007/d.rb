a, b = gets.chomp.split(' ').map{|num| num.to_i}

def count49(num, rank)
  return 0 if rank<0

  mln = num/(10**rank)
  if mln==4 || mln==9
    return num % (10**rank) + count49((10**rank)*mln-1, rank) + 1
  elsif mln<4
    return mln*(10**rank - 8**rank)  + count49(num % (10**rank), rank-1)
  else
    return (mln-1)*(10**rank - 8**rank)  + count49(num % (10**rank), rank-1) + (10**rank)
  end
end

puts count49(b, b.to_s.length) - count49(a-1, a.to_s.length)

