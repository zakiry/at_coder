def get_str(nums, c)
  str = ''
  nums.each do |i|
    str = str + c[i]
  end
  str
end

# 入力
n, m, k = gets.split.map(&:to_i)
c = gets.split(&:to_i)

e = []
n.times do
  e << []
end
m.times do
  a, b = gets.split.map(&:to_i)
  e[b-1] << a-1
end

# 初期化
strs = []
n.times do |i|
  strs << {0 => [], 1 => [i]}
end

# 処理
1.upto(k) do |char_length|
  n.times do |i|
    e[i].each do |prev|
      char_length.times do |j|
        break if strs[prev][j].nil?
        strs[i][j+1] = [strs[prev][j], i].flatten unless strs[prev][j].include?(i)
        if !strs[i][j+1].nil? && !strs[prev][j+1].nil?
          strs[i][j+1] = strs[prev][j+1] if get_str(strs[i][j+1], c) > get_str(strs[prev][j+1], c)
        elsif !strs[prev][j+1].nil?
          strs[i][j+1] = strs[prev][j+1]
        end
      end
    end
  end
end

# 出力
answers = []
strs.each do |nums|
  answers << get_str(nums[k], c) unless nums[k].nil?
end
if answers.length==0
puts -1
else
  puts answers.min
end

