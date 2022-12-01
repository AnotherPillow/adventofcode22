input_string = File.read('input.txt')

tempadding = 0
calories = 0
elves = []

for line in input_string.lines
  if line.match(/^[0-9]+$/)
    tempadding += line.to_i
  else
    elves.push(tempadding)
    tempadding = 0
  end
end

for elf in elves
  if elf > calories
    calories = elf
  end
end
puts calories