n = gets.chomp.to_i

votes = {}
n.times do
  name = gets.chomp
  votes[name] = votes[name].to_i+1 || 1
end

max_vote = votes.max_by{|_, v| v}
puts max_vote.first

