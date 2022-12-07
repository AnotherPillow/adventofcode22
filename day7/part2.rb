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

temp = []
for value in sizes.values
  temp.push(value) if not value < sizes.values.max - 40000000
end
puts temp.min