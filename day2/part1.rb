input_string = File.read('input.txt')

score = 0

for line in input_string.lines
  opponent = line.split(' ')[0]
  us = line.split(' ')[1]

  opponent.gsub!('A', 'rock')
  opponent.gsub!('B', 'paper')
  opponent.gsub!('C', 'scissors')

  us.gsub!('X', 'rock')
  us.gsub!('Y', 'paper')
  us.gsub!('Z', 'scissors')

  case us
  when "rock"
    score += 1
  when "paper"
    score += 2
  when "scissors"
    score += 3
  end

  if opponent == us
    score += 3
  elsif opponent == "rock" && us == "paper"
    score += 6
  elsif opponent == "rock" && us == "scissors"
    score += 0
  elsif opponent == "paper" && us == "rock"
    score += 0
  elsif opponent == "paper" && us == "scissors"
    score += 6
  elsif opponent == "scissors" && us == "rock"
    score += 6
  elsif opponent == "scissors" && us == "paper"
    score += 0
  end

end

puts score