function isNumber(num1, num2)
    return tonumber(num1) ~= nil, tonumber(num2) ~= nil
end

operations = {
    ["+"] = function(x, y) return x + y end,
    ["-"] = function(x, y) return x - y end,
    ["*"] = function(x, y) return x * y end,
    ["/"] = function(x, y) return x / y end,
    ["^2"] = function(x) return x ^ 2 end,
    ["^3"] = function(x) return x ^ 3 end,
}

while true do
    io.write("Enter operation (+, -, *, /, ^2, ^3) or type 'off' to exit: ")
    operation = string.lower(io.read())

    if operation == "off" then
        print("Exiting")
        break
    end

    if not operations[operation] then
        print("ENTER VALID OPERATION!")

        goto continue
    end

    while true do
        io.write("Enter first number: ")
        num1 = tonumber(io.read())

        if not isNumber(num1) then
            print("Enter valid number!")
        else
            break
        end
    end

    while true do
        if operation ~= "^2" and operation ~= "^3" then
            io.write("Enter second number: ")
            num2 = io.read()
        end

        if not isNumber(num2) then
            print("Enter valid number!")
        else
            break
        end
    end

    result = operations[operation](num1, num2)
    print("Result: " .. result)

    ::continue::
end
