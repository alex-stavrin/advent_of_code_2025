local function add_to_pointing_number(pointing_number, amount_to_add, times_passed_from_0)
    local new_pointing_number = pointing_number + amount_to_add

    if new_pointing_number > 99 then
        -- we have to subtract 100 because we start from 0
        while not (new_pointing_number >= 0 and new_pointing_number <= 99) do            
            new_pointing_number = new_pointing_number - 100
            times_passed_from_0[0] = times_passed_from_0[0] + 1
        end
    end

    return new_pointing_number
end

local function remove_from_pointing_number(pointing_number, amount_to_remove, times_passed_from_0)
    local new_pointing_number = pointing_number - amount_to_remove

    
    if pointing_number == 0 then 
        times_passed_from_0[0] = times_passed_from_0[0] - 1
    end

    if new_pointing_number < 0 then
        -- we have to add 100 because we start from 0
        while not (new_pointing_number >= 0 and new_pointing_number <= 99) do           
            new_pointing_number = new_pointing_number + 100
            times_passed_from_0[0] = times_passed_from_0[0] + 1
        end
    end
    
    if new_pointing_number == 0 then
        times_passed_from_0[0] = times_passed_from_0[0] + 1
    end

    return new_pointing_number
end

local input_file = "input.txt"

local file = io.open(input_file, "r")

if file then

    local pointing_number = 50
    local times_passed_from_0 = {}
    times_passed_from_0[0] = 0

    for line in file:lines() do
        -- capture the input
        local turning_direction, turning_amount_string = line:match("([LR])(%d+)")
        local turning_amount = tonumber(turning_amount_string)

        if turning_direction == "L" then
            pointing_number = remove_from_pointing_number(pointing_number, turning_amount, times_passed_from_0)
        else
            pointing_number = add_to_pointing_number(pointing_number, turning_amount, times_passed_from_0)
        end
    end

    print(times_passed_from_0[0])

    file:close()
end