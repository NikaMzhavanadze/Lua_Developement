Check = true

function PasswordGenerator()
  AverySymbol = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q",
    "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "!", "@", "#", "$",
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
    while x <= lengthInput do
      password = password .. AverySymbol[math.random(1, #AverySymbol)]
      x = x + 1
    end
  end


  if string.match(password, "%l") and string.match(password, "%u") and string.match(password, "%x") then
    print(password)
    Check = false
  else
    print(password)
    print("There is no valid symbols! DO NOT USE!")
  end

  ::continue::
end

while Check do
  PasswordGenerator()
end
