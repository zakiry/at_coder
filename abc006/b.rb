n = gets.chomp.to_i - 1

mod = 10**4 + 7
a = [0, 0, 1]

3.upto(n) do |i|
  a[i] = (a[i-1] + a[i-2] + a[i-3]) % mod
end

puts a[n]

