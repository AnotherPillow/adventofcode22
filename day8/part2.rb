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
score = 0
(1..width - 2).each do |x|
  (1..height - 2).each do |y|
    left = forest[x][0, y].reverse
    right = forest[x][y + 1, width]
    up = other_forest[y][0, x].reverse
    down = other_forest[y][x + 1, height]
    tree_height = forest[x][y]
    nums = []
    [left, right, up, down].each_with_index do |view, v_index|
      max = 0
      view.each_with_index do |tree, t_index|
        max = t_index
        break if tree >= tree_height
      end
      nums[v_index] = max + 1
    end
    new_score = nums.inject(:*)
    score = new_score if new_score > score
  end
end
puts score