input_string = File.read('input.txt')

score = 0

for line in input_string.lines
  #X need sto lose
  #Y draw
  #Z win

  #score for Rock is 1
  #score for Paper is 2
  #score for Scissors is 3

  #0 for win
  #3 for draw
  #6 for lose

  #ROCK === A
  #PAPER === B
  #SCISSORS === C

  
  if line.start_with? "A Y"
    score += 4
  elsif line.start_with? "A Z"
    score += 8
  elsif line.start_with? "A X"
    score += 3
  elsif line.start_with? "B Y"
    score += 5
  elsif line.start_with? "B Z"
    score += 9
  elsif line.start_with? "B X"
    score += 1
  elsif line.start_with? "C Y"
    score += 6
  elsif line.start_with? "C Z"
    score += 7
  elsif line.start_with? "C X"
    score += 2
  end

end

puts score