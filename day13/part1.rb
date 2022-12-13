input = File.read('input.txt')

pair1, pair2 = nil, nil
pairs = {}
i = 1
input.lines.each do |line|
  if not line.start_with?("[")
    pairs[i] = { left: pair1, right: pair2 }
    i += 1
    pair1 = nil
    pair2 = nil
  elsif pair1.nil?  
    pair1 = eval(line)
    pair2 = nil
  else
    pair2 = eval(line)
  end
end

def compare(l,r)
  max_index = [l.size, r.size].max
  (0..max_index - 1).each do |i|
    left = l[i]
    right = r[i]
    return true if left.nil? && !right.nil?
    return false if right.nil? && !left.nil?
    if left.is_a?(Integer) && right.is_a?(Integer)
      return true if left < right
      return false if left > right
    end

    res = compare([left], right) if left.is_a?(Integer) && right.is_a?(Array)
    res = compare(left, [right]) if left.is_a?(Array) && right.is_a?(Integer)
    res = compare(left, right) if left.is_a?(Array) && right.is_a?(Array)
    return res unless res.nil?
  end
  nil
end
sum = 0
pairs.each do |key, value|
  pairs[key][:order] = compare(value[:left], value[:right])
  sum += key if pairs[key][:order]
end
puts sum