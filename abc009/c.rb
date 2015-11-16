n, k = gets.chomp.split(' ').map{|num| num.to_i}
s = gets.chomp

def diff_count(s1, s2)
  count = 0
  s1.length.times do |i|
    count = count + 1 if s1[i]!=s2[i]
  end
  return count
end

def diff(s1, s2)
  count = 0
  ('a'..'z').to_a.each do |c|
    count = count + [s1.count(c), s2.count(c)].min
  end
  s1.length - count
end

def get_unused_chars(s, t)
  ret = s.clone
  t.chars do |c|
    ret.slice!(ret.index(c))
  end
  ret.chars.sort.join
end

t = ""

n.times do |i|
  c_list = get_unused_chars(s, t)
  c_list.length.times do |j|
    c_sub = c_list.clone
    c_sub.slice!(j)
    if diff_count(s[0..i], t+c_list[j]) + diff(s[(i+1)..-1], c_sub) <= k
      t = t + c_list[j]
      break
    end
  end
end

puts t

