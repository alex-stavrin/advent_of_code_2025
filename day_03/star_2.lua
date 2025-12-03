

local input_file = "input.txt"

local file = io.open(input_file, "r")

if file then

    local sum = 0

    for line in file:lines() do

        local total_batteries = #line
        local batteries_left = 12
     
        local where_to_start = 1

        local final_string = ""

        while batteries_left > 0 do     
            local max_pos = where_to_start
            local max_number = tonumber(string.sub(line, where_to_start, where_to_start))
            for i = max_pos + 1, #line do
                local number = tonumber(string.sub(line, i, i))
                if number > max_number and (total_batteries - i) + 1 >= batteries_left then
                    max_number = number
                    max_pos = i
                end
            end
            final_string = final_string .. tostring(max_number)
            where_to_start = max_pos + 1
            batteries_left = batteries_left - 1    
        end

        print(final_string)

        sum = sum + tonumber(final_string)

    end

    print(sum)

    file:close()
end