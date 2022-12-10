input = File.read('input.txt').split("\n")
instructions = {
  'addx' => 2,
  'noop' => 1,
}

x = [1]

for l in input
  line = l.split(" ")
  instruction = line[0]
  value = line[1]

  cycles = instructions[instruction]
  1.upto(cycles) do |cycle|
    x << x.last + value.to_i if cycle == cycles
    x << x.last if not cycle == cycles

  end
end

signals = [20, 60, 100, 140, 180, 220].map { |i| x[i - 1] * i }
ans = 0

for signal in signals
  ans += signal
end

puts ans