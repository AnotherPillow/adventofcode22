input = File.read('input.txt')

overlaps = 0

def get_range(line)
  min, max = line.split('-').map(&:to_i)
  (min..max).to_a
end

input.each_line do |line|
  first, second = line.split(',')
  
  first = get_range(first)
  second = get_range(second)

  overlaps += 1 if first.intersect?(second) || second.intersect?(first)
end

puts overlaps