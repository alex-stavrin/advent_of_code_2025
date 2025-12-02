local input_file = "input.txt"

local file = io.open(input_file, "r")

local ranges = {}

-- read the ranges from the file and and save them to 2D table as strings
if file then

    local line = file:read("*all")

    for field in line:gmatch("[^,]+") do
        local number_1, number_2  = field:match("(%d+)-(%d+)")
        local number_range = {number_1, number_2}
        table.insert(ranges, number_range)
    end

    file:close()
end


local invalid_sum = 0

for key, value in pairs(ranges) do

    local min = tonumber(value[1])
    local max = tonumber(value[2])

    for i = min, max, 1 do

        local i_string = tostring(i)

        local sub_string_offset = 0
        while sub_string_offset < #i_string - 1 do

            for j = 1, #i_string, sub_string_offset + 1 do

                local sub_string_1 = string.sub(i_string, j, j + sub_string_offset)
                local sub_string_2 = string.sub(i_string, j + sub_string_offset + 1, #i_string)

                if(sub_string_1 == sub_string_2) then
                    local only =  true
                    for i = 1, #i_string, #sub_string_1 do
                        local sub = string.sub(i_string, i, i + #sub_string_1 - 1)
                        if sub ~= sub_string_1 then
                            only = false
                        end
                    end
                    if only then
                        -- print(i, sub_string_1)
                        invalid_sum = invalid_sum + i
                        goto out_of_loop
                    end
                end
            end

            sub_string_offset = sub_string_offset + 1
        end

        ::out_of_loop::
    end
end

print(invalid_sum)