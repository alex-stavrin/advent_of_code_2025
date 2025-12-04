local input_file = "input.txt"

local function check_pos_for_paper(i, j, map)
    
    local number_of_rows = #map
    local number_of_columns = # map[1]

    if i >= 1 and i <= number_of_rows and j >= 1 and j <= number_of_columns then
        if map[i][j] == '@' then
            return true
        end
    end

    return false
end

local function can_lift_paper_roll(i, j, map, marked_map)

    local paper_count = 0

    -- check right
    if check_pos_for_paper(i, j+1,map) then
        paper_count = paper_count + 1
    end

    -- check left
    if check_pos_for_paper(i, j-1, map) then
        paper_count = paper_count + 1
    end

    -- check bottom
    if check_pos_for_paper(i+1,j,map) then
        paper_count = paper_count + 1
    end

    -- check top
    if check_pos_for_paper(i-1, j, map) then
        paper_count = paper_count + 1
    end

    -- check diagonal top right
    if check_pos_for_paper(i-1, j+1, map) then
        paper_count = paper_count + 1
    end

    -- check diagonal top left
    if check_pos_for_paper(i-1, j-1, map) then
        paper_count = paper_count + 1
    end

    -- check diagonal bottom right
    if check_pos_for_paper(i+1, j+1, map) then
        paper_count = paper_count + 1
    end

    -- check diagonal bottom left
    if check_pos_for_paper(i+1, j-1, map) then 
        paper_count = paper_count + 1
    end

    if paper_count < 4 then
        marked_map[i][j] = 'x'
        return true
    end

    return false
end

local file = io.open(input_file, "r")
local map = {}
local marked_map = {}


if file then

    local row_index = 1

    for line in file:lines() do
        map[row_index] = {}
        marked_map[row_index] = {}
        for i = 1, #line do
            map[row_index][i] = string.sub(line,i,i)
            marked_map[row_index][i] = string.sub(line,i,i)
        end

        row_index = row_index + 1
    end

    file:close()
end


local can_be_lifted_count = 0
for i, row in ipairs(map) do
    local line = ""
    for j, char in ipairs(row) do
        line = line .. char
        if char == '@' then
            local res = can_lift_paper_roll(i, j, map, marked_map)
            if res then
                can_be_lifted_count = can_be_lifted_count + 1
            end
        end
    end
    -- print(line)
end

print(can_be_lifted_count)

-- print("")

-- for i, row in ipairs(marked_map) do
--     local line = ""
--     for j, char in ipairs(row) do
--         line = line .. char
--     end
--     print(line)
-- end