n, m = gets.chomp.split.map(&:to_i)

A, O, C = 2, 3, 4
a, o, c = 0, 0, 0

if !(m.to_f/n).between?(A, C)
  a, o, c = [-1]*3
elsif (m/n) < 3
  o = m - n*A
  a = n - o
else
  c = m - n*O
  o = n - c
end

puts "#{a} #{o} #{c}"

