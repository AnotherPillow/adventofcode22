input_string = File.read('input.txt')

tempadding = 0
calories = 0

elves = []
results = []

for line in input_string.lines
  if line.match(/^[0-9]+$/)
    tempadding += line.to_i
  else
    elves.push(tempadding)
    tempadding = 0
  end
end

results.push(elves.max)

elves.delete_at(elves.index(elves.max))

results.push(elves.max)

elves.delete_at(elves.index(elves.max))

results.push(elves.max)

elves.delete_at(elves.index(elves.max))

puts results 
puts results.inject(:+)