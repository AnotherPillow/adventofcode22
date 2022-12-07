input = File.read("input.txt")

sizes = Hash.new(0)

input.lines.map(&:split).each_with_object([]) do |line, path|
  case line 
    in ['$', 'cd', '..']
      path.pop
    in ['$', 'cd', dir]
      path.push([path[-1], dir].compact.join(' '))
    in [size, file] if size.match?(/[0-9]+/)
      path.each { |i| sizes[i] += size.to_i }
    else
  end
end

sum = 0
for value in sizes.values
  sum += value if not value > 100_000
end
puts sum