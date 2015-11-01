n = gets.chomp.to_i
c = []
n.times do
  c << gets.chomp.to_i
end

dp = []

def search(num, list)
  return 0 if list.length==0 || num<list[0]
  return list.length if num>list[-1]

  half_list = []
  offset=0
  if num < list[list.length/2]
    half_list = list[0..list.length/2-1]
  else
    half_list = list[list.length/2..-1]
    offset = list.length/2
  end
  offset + search(num, half_list)
end

n.times do |i|
  index = search(c[i], dp)
  dp[index] = c[i]
end

puts n-dp.length

