input = File.read('input.txt')

packets = []

input.lines.each do |line|
  packets << eval(line)
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

packets << [[2]]
packets << [[6]]

packets = packets.compact
packets =
  packets.sort do |left, right|
    res = compare(left, right)
    if res.nil?
      0
    elsif res
      -1
    else
      1
    end
  end

nums = []
packets.each_with_index do |val, i|
  nums << (i + 1) if [[[2]], [[6]]].include?(val)
end
puts nums.inject(:*)

