file = File.read('input.txt')
stacks = file.split("\n\n")[0]
instructions = file.split("\n\n")[1]
stacks = stacks.split("\n").map(&:chars).reverse.transpose

stacks = stacks.select{|first, *rest| first.match?(/\d+/) }

stacks.map{|list| list.delete(" ")}

stacks = stacks.map{|first, *rest| [first, rest]}.to_h


instructions.split("\n").each do |instruction|
  move, source, dest = instruction.scan(/\d+/)
  
  move.to_i.times do
    stacks[dest] << stacks[source].pop
  end
end

puts stacks.values.map(&:last).join