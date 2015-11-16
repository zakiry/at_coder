n = gets.chomp.to_i

a = []
n.times do
  a << gets.chomp.to_i
end

a.uniq!
a.sort!
puts a[-2]

