input = File.read('input.txt').strip.split("\n\n")

monkeys = []



for monkey in input
  lines = monkey.split("\n")
  monkeys.push({
    items: lines[1].sub('  Starting items: ', '').split(', ').map(&:to_i),
    operation: lines[2].sub('  Operation: new = old ', '').then do |op|
      next [:pow, 2] if op == '* old'
      (cmd, val) = op.split(' ')
      [cmd.to_sym, val.to_i]
    end,
    divide_by: lines[3].sub('  Test: divisible by ', '').strip.to_i,
    throw1: lines[4].sub('    If true: throw to monkey ', '').to_i,
    throw2: lines[5].sub('    If false: throw to monkey ', '').to_i,
    inspections: 0
  })
    
end


20.times do
  monkeys.each do |monkey|
    monkey[:inspections] += monkey[:items].length
    monkey[:items].each do |item|
      level = item.send(*monkey[:operation]) / 3
      
      throw_to = (level % monkey[:divide_by]) == 0 ? monkey[:throw1] : monkey[:throw2]
      monkeys[throw_to][:items].push(level)
    end
    monkey[:items] = []
  end
end
ans = monkeys.map { |m| m[:inspections] }.sort.reverse.take(2).inject(&:*)

puts ans

