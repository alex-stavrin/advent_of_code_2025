local input_file = "input.txt"

local file = io.open(input_file, "r")

local reading_ranges = true
local ranges = {}
local availables = {}

if file then

    for line in file:lines() do
        if line == "" then
            reading_ranges = false
        end

        if reading_ranges then
            local number_1, number_2  = line:match("(%d+)-(%d+)")
            local range = {tonumber(number_1), tonumber(number_2)}
            table.insert(ranges, range)
        else
            table.insert(availables, tonumber(line))
        end
    end

    file:close()
end


-- for index, value in ipairs(ranges) do
--     print(value[1], "-", value[2])
-- end

-- for index, value in ipairs(availables) do
--     print(value)
-- end

local fresh_count = 0

for index, food_item in ipairs(availables) do
    for index, range in ipairs(ranges) do
        if food_item >= range[1] and food_item <= range[2] then
            fresh_count = fresh_count + 1
            break
        end 
    end
end

print(fresh_count)