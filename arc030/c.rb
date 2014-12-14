@n
@src
@dst
@visited
@post_number
@group_number

def dfs1(current)
  return if @visited[current]
  @visited[current] = true
  @src[current].each do |next_point|
    dfs1 next_point
  end
  @post_number << current
end

def dfs2(current, group_id)
  return if @group_number[current]
  @group_number[current] = group_id
  @dst[current].each do |next_point|
    dfs2 next_point, group_id
  end
end

def dscc
  @visited = []
  @post_number = []
  @n.times do |i|
    dfs1 i if @visited[i].nil?
  end

  @group_number = []
  group = 0
  @n.times do |i|
    if @group_number[@post_number[-(i+1)]].nil?
      dfs2 @post_number[-(i+1)], group
      group = group + 1
    end
  end
end

# 入力
@n, m, k = gets.split.map(&:to_i)
c = gets.split(&:to_i)

@src = Array.new(@n){[]}
@dst = Array.new(@n){[]}
m.times do
  a, b = gets.split.map(&:to_i)
  @src[a-1] << b-1
  @dst[b-1] << a-1
end

# 処理
# 強連結分解
dscc
# グラフを再構築する
n = @group_number.max + 1

group_str = Array.new(n){[]}
@n.times do |i|
  group_id = @group_number[i]
  group_str[group_id] << c[i]
end
group_str.map! { |str_array| str_array.sort.join }

strs = []
n.times do |i|
  str = group_str[i]
  hash = { 0 => '' }
  str.length.times do |len|
    break if len >= k
    hash[len+1] = str[0..len]
  end
  strs << hash
end

src = Array.new(n){[]}
@n.times do |i|
  @src[i].each do |dst|
    src[@group_number[i]] << @group_number[dst] if @group_number[i]!=@group_number[dst]
  end
end
src.map!{ |str| str.uniq}

result = strs.clone
n.times do |i|
  src[i].each do |next_num|
    hash = result[next_num].clone
    0.upto(k) do |str_len|
      str1 = result[i][str_len]
      next if str1.nil?
      strs[next_num].length.times do |j|
        break if str_len + j > k
        str2 = strs[next_num][j]
        hash[str_len+j] ||= str1 + str2
        hash[str_len+j] = [hash[str_len+j], str1+str2].min
      end
    end
    result[next_num] = hash
  end
end

# 出力
ans = []
result.each do |str|
  ans << str[k] unless str[k].nil?
end
if ans.empty?
  puts -1
else
  puts ans.min
end

