input = File.read('input.txt')

temp = ""

output = 0

input.chars.each_with_index do |char, index|
  temp += char
  if temp.length >= 4
    if temp.chars.uniq.length == temp.length
      output = index + 1
      break
    end
    temp = temp[1..-1]
  end
end

puts output