a, b = gets.chomp.split(' ').map{|num| num.to_i}
N = 20

@memo = []
N.times do |i|
  @memo[i] = (10**i)-(8**i)
end

def count49(num, rank)
  return 0 if rank<0

  rank_num = (10**rank)
  mln = num / rank_num
  leave_nums = num % rank_num
  if mln==4 || mln==9
    return leave_nums  + count49(mln*rank_num-1, rank) + 1
  elsif mln<4
    return mln*@memo[rank] + count49(leave_nums, rank-1)
  else
    return (mln-1)*@memo[rank]  + count49(leave_nums, rank-1) + rank_num
  end
end

puts count49(b, b.to_s.length) - count49(a-1, a.to_s.length)

