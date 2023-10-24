Class = require "class"
require "EnglishWordsDictionary"


math.randomseed(os.time())

randomWordGenerator = allWords[math.random(1, #allWords)]
-- print(randomWordGenerator)
print("Guess the word :)")

guessedWord = string.rep("_", string.len(randomWordGenerator))
print(guessedWord)

local healthPoints = 10
print("Health Points: " .. healthPoints)

while guessedWord ~= randomWordGenerator and healthPoints > 0 do
  io.write("\nEnter Letter: ")
  letter = io.read()

  if letter:match("%d") then
    print("Invalid input")
  elseif string.len(letter) > 1 then
    if letter == randomWordGenerator then
      guessedWord = randomWordGenerator
      break
    else
      print("Incorrect :p. You have " .. healthPoints .. " health points left")
    end
  else
    updatedWord = ""
    correctGuess = false
    for i = 1, string.len(randomWordGenerator) do
      targetChar = string.sub(randomWordGenerator, i, i)
      if targetChar == letter then
        updatedWord = updatedWord .. letter
        correctGuess = true
      else
        updatedWord = updatedWord .. string.sub(guessedWord, i, i)
      end
    end

    if not correctGuess then
      healthPoints = healthPoints - 1
      print("Incorrect guess! Health Points left: " .. healthPoints)
    end

    guessedWord = updatedWord
    print(guessedWord)
  end
end

if healthPoints == 0 then
  print("Sorry, You Don't Have Health :( correct word was: " .. randomWordGenerator)
else
  print("Congratulations! You guessed the word: " .. randomWordGenerator)
end
