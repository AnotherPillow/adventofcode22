input = File.read('input.txt')

bridge_size = 800
visited = { "#{bridge_size / 2}:#{bridge_size / 2}" => 1 }
bridge = Array.new(bridge_size) { Array.new(bridge_size) }

positions = {'H' => {x: bridge_size / 2, y: bridge_size / 2},}

(1..9).each do |i|
  positions[i.to_s] = {x: bridge_size / 2, y: bridge_size / 2}
end

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

  if line == 1 && dist == 4
    if end_x < head_x
      end_x += 1
      end_y += 1
    else
      end_x -= 1
      end_y -= 1
    end
  end

  if line == -1 && dist == 4
    if end_x < head_x
      end_x += 1
      end_y -= 1
    else
      end_x -= 1
      end_y += 1
    end
  end

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
    positions.each do |key, value|
      bridge[value[:x]][value[:y]] = '#' if key == '9'
      bridge[value[:x]][value[:y]] = '.' if not key == '9'
    end


    if dir == 'L'
      positions['H'][:x] = positions['H'][:x] - 1
    elsif dir == 'R'
      positions['H'][:x] = positions['H'][:x] + 1
    elsif dir == 'U'
      positions['H'][:y] = positions['H'][:y] + 1
    elsif dir == 'D'
      positions['H'][:y] = positions['H'][:y] - 1
    end

    head_x = positions['H'][:x]
    head_y = positions['H'][:y]
    (1..9).each do |i|
      head_x, head_y = update(head_x, head_y, positions[i.to_s][:x], positions[i.to_s][:y])
      positions[i.to_s][:x] = head_x
      positions[i.to_s][:y] = head_y
    end

    positions.each do |key, value|
      bridge[value[:x]][value[:y]] = key
    end

    visited["#{positions['9'][:x]}:#{positions['9'][:y]}"] = 1 if visited["#{positions['9'][:x]}:#{positions['9'][:y]}"].nil?
    visited["#{positions['9'][:x]}:#{positions['9'][:y]}"] += 1 

    ans << visited.size

  end
end

puts ans.max