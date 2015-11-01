n = gets.chomp.to_i

ans = 'NO'

ans = 'YES' if n%3 == 0
ans = 'YES' if n.to_s.index('3')

puts ans

