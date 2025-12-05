local input_file = "input.txt"

local file = io.open(input_file, "r")

local ranges = {}

if file then

    for line in file:lines() do
        local number_1, number_2  = line:match("(%d+)-(%d+)")
        if number_1 and number_2 then            
            local range = {tonumber(number_1), tonumber(number_2)}
            table.insert(ranges, range)
        end
    end

    file:close()
end

table.sort(ranges, 
    function(range_a,range_b)
        return range_a[1] < range_b[1]
    end
)

local index = 1
while index < #ranges do
    
    if ranges[index][2] >= ranges[index + 1][1] then
        ranges[index][2] = math.max(ranges[index][2], ranges[index + 1][2])
        table.remove(ranges, index+1)
    else
        index = index + 1
    end
end

local valid_counter = 0
for index, value in ipairs(ranges) do
    -- print(value[1], value[2])
    valid_counter = valid_counter + value[2] - value[1] + 1
end

print(valid_counter)