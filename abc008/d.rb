require 'thread'

w, h = gets.chomp.split(' ').map{|num| num.to_i}
n = gets.chomp.to_i

UP, RIGHT, DOWN, LEFT = [0, 1], [1, 0], [0, -1], [-1, 0]

points = []
n.times do
  x, y = gets.chomp.split(' ').map{|num| num.to_i}
  points << [x, y]
end

p_list = points.permutation(points.length)
q = Queue.new

def get_initial_golds(w, h)
  golds = Array.new(w+2){Array.new(h+2){true}}
  (w+2).times do |i|
    (h+2).times do |j|
      golds[i][j] = false if i==0 || j==0 || i==(w+1) || j==(h+1)
    end
  end
  golds
end

def show(golds)
  puts '--'
  golds.each do |line|
    line.each do |block|
      print 1 if block
      print 0 unless block
    end
    puts
  end
  puts '--'
end

results = []
p_list.each do |m_list|
  golds = get_initial_golds(w, h)
  gold_count = 0
  m_list.each do |point|
    gold_count = gold_count + 1
    golds[point.first][point.last] = false

    q.push([point, UP])
    q.push([point, RIGHT])
    q.push([point, DOWN])
    q.push([point, LEFT])
    until q.empty?
      pop_data = q.pop
      c_p = pop_data.first
      n_p = pop_data.last
      if golds[c_p.first+n_p.first][c_p.last+n_p.last]
        gold_count = gold_count + 1
        golds[c_p.first+n_p.first][c_p.last+n_p.last] = false
        q.push([[c_p.first+n_p.first, c_p.last+n_p.last], n_p])
      end
    end
  end
  results << gold_count
end

puts results.max

