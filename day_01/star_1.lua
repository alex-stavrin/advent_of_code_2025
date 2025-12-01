local function add_to_pointing_number(pointing_number, amount_to_add)
    local new_pointing_number = pointing_number + amount_to_add

    if new_pointing_number > 99 then
        -- we have to subtract 100 because we start from 0
        while not (new_pointing_number >= 0 and new_pointing_number <= 99) do            
            new_pointing_number = new_pointing_number - 100
        end
    end

    return new_pointing_number
end

local function remove_from_pointing_number(pointing_number, amount_to_remove)
    local new_pointing_number = pointing_number - amount_to_remove

    if new_pointing_number < 0 then
        -- we have to add 100 because we start from 0
        while not (new_pointing_number >= 0 and new_pointing_number <= 99) do           
            new_pointing_number = new_pointing_number + 100
        end
    end

    return new_pointing_number
end

local input_file = "input.txt"

local file = io.open(input_file, "r")

if file then

    local pointing_number = 50
    local times_pointed_at_0 = 0

    for line in file:lines() do
        -- capture the input
        local turning_direction, turning_amount_string = line:match("([LR])(%d+)")
        local turning_amount = tonumber(turning_amount_string)
        

        if turning_direction == "L" then
            pointing_number = remove_from_pointing_number(pointing_number, turning_amount)
        else
            pointing_number = add_to_pointing_number(pointing_number, turning_amount)
        end

        if pointing_number == 0 then
            times_pointed_at_0 = times_pointed_at_0 + 1
        end
    end

    print(times_pointed_at_0)

    file:close()
end