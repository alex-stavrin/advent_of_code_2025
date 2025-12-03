local input_file = "input.txt"

local file = io.open(input_file, "r")

if file then

    local sum = 0

    for line in file:lines() do
        
        local max_number_1_string = string.sub(line, 1, 1)
        local max_number_1 = tonumber(max_number_1_string)
        local max_number_1_i = 1
        for i = 2, #line - 1 do
            local number_string = string.sub(line, i, i)
            local number = tonumber(number_string)
            if number > max_number_1 then
                max_number_1 = number
                max_number_1_i = i
            end
        end

        local max_number_2_string = string.sub(line, max_number_1_i + 1, max_number_1_i + 1)
        local max_number_2 = tonumber(max_number_2_string)
        for i = max_number_1_i + 1, #line do
            local number_string = string.sub(line, i, i)
            local number = tonumber(number_string)
            if number > max_number_2 then
                max_number_2 = number
            end          
        end

        local max_number_1_string = tostring(max_number_1)
        local max_number_2_string = tostring(max_number_2)

        local actual_number_string = max_number_1_string .. max_number_2_string
        local actual_number = tostring(actual_number_string)

        sum = sum + actual_number
    end

    print(sum)

    file:close()
end