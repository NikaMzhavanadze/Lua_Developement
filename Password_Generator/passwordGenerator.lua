function PasswordGenerator()
  lowercase = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z", }

  uppercase = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
    "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }

  symbols = { "!", "@", "#", "$",
    "%", "^", "&", "*", "(", ")", "_", "+", "=", "-", "{", "}", "[", "]", ":", ";", "'",
    ",", ".", "<", ">", "/", "?", "\"", "~", "`", "|" }

  print("Enter length of the password:")
  lengthInput = tonumber(io.read())
  if lengthInput < 8 then
    print("To Short!")
    goto continue
  end
  password = ""

  x = 0

  math.randomseed(os.time())

  for _ = 1, lengthInput do
    while x <= lengthInput / 3 do
      password = password ..
          lowercase[math.random(1, #lowercase)] ..
          uppercase[math.random(1, #uppercase)] .. symbols[math.random(1, #symbols)]
      x = x + 1
    end
  end

  print(password)
  ::continue::
end

PasswordGenerator()
