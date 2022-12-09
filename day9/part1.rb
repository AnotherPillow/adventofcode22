input = File.read('input.txt')

bridge_size = 800
visited = { "#{bridge_size / 2}:#{bridge_size / 2}" => 1 }
bridge = Array.new(bridge_size) { Array.new(bridge_size) }

head_x = bridge_size / 2
head_y = bridge_size / 2
end_x = bridge_size / 2
end_y = bridge_size / 2

ans = []

def update(head_x, head_y, end_x, end_y)
  dist = (head_x - end_x).abs + (head_y - end_y).abs
  line = (head_y - end_y).to_f / (head_x - end_x)
  return end_x, end_y unless dist > 1 && (!line.zero? || line != 1.0/0.0 || line != 1.0/0.0)

  if line.zero?
    if head_x > end_x
      end_x += 1
    else
      end_x -= 1
    end
  end

  end_y += 1 if line == 1.0/0.0
  end_y -= 1 if line == -1.0/0.0

  if [2, 0.5].include?(line)
    if end_x < head_x
      end_x += 1
      end_y += 1
    else
      end_x -= 1
      end_y -= 1
    end
  end

  if [-2, -0.5].include?(line)
    if end_x < head_x
      end_x += 1
      end_y -= 1
    else
      end_x -= 1
      end_y += 1
    end
  end

  [end_x, end_y]
end

input.lines do |line|
  dir, dist = line.split
  (1..dist.to_i).each do
  bridge[head_x][head_y] = '.'
  bridge[end_x][end_y] = '#'
  if dir == 'L'
    head_x -= 1
  elsif dir == 'R'
    head_x += 1
  elsif dir == 'U'
    head_y += 1
  elsif dir == 'D'
    head_y -= 1
  end
  end_x, end_y = update(head_x, head_y, end_x, end_y)
  bridge[end_x][end_y] = 'T'
  bridge[head_x][head_y] = 'H'

  visited["#{end_x}:#{end_y}"] =
    if visited["#{end_x}:#{end_y}"].nil?
      1
    else
      visited["#{end_x}:#{end_y}"] + 1
    end
  ans << visited.size

end
end

puts ans.max