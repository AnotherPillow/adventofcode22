input = File.read('input.txt').split("\n")
forest = []
other_forest = []
for line in input
  rows = line.chars.map(&:to_i)
  forest << rows
  rows.each_with_index do |num, i|
    if other_forest[i].nil?
      other_forest[i] = [num]
    else
      other_forest[i] << num
    end
  end
end
width = forest[0].size
height = forest.size
trees = 0
(1..width-2).each do |x|
  (1..height-2).each do |y|
    left_highest = forest[x][0, y].max
    right_highest = forest[x][y + 1, width].max
    up_highest = other_forest[y][0, x].max
    down_highest = other_forest[y][x + 1, height].max
    next if !(forest[x][y] > left_highest || forest[x][y] > right_highest || forest[x][y] > up_highest || forest[x][y] > down_highest)

    trees += 1
  end
end
ans = trees + (2 * width) + (2 * (height - 2))
puts ans