mapgen = {

}

room = {
        "#############^#############",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "(                         )",
        "(                         )",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#############V#############",
    }

function mapgen.gen()
    for index, value in ipairs(room) do
        room[index] = value .. value .. value
    end

    local temp = {}

    for _ = 1, 3, 1 do
        for index, value in ipairs(room) do
        table.insert(temp, value)
        end
    end

    for key, value in pairs(temp) do
        table.insert(room, value)
    end

    for index, value in ipairs(room) do
        if string.sub(value, 1, 1) == "(" then
            value = "#" .. string.sub(value, 2)
        end

        if string.sub(value, -1) == ")" then
            value = string.sub(value, 1, -2) .. "#"
        end

        room[index] = value
    end

    room[1] = string.gsub(room[1], "%^", "#")
    room[#room] = string.gsub(room[#room], "V", "#")

    --[[for i = 1, 350 do
        local x = math.ceil(math.random() * #room[1])
        local y = math.ceil(math.random() * #room)

        local char = string.sub(room[y], x, x)

        if char ~= "#" then
            local line = room[y]
            room[y] = string.sub(line, 1, x - 1) .. "#" .. string.sub(line, x + 1)
        end
    end]]

    -- I've made "walls" but I don't like them... I need to write other algorith for that not just random noise (who could've guessed)



    local tablefiedRoom = {} --for better manipulation, because LUA strings sucks, it's not like array while tables are... they jsut start at 1 not zero

    for j = 1, #room do
        tablefiedRoom[j] = {}
        for i = 1, #room[j] do
            table.insert(tablefiedRoom[j], string.sub(room[j], i, i))
        end
    end

    --this makes copy of the map but in table instead of string

    tablefiedRoom[5][5] = "#" -- random test of changing nothing to wall

    local xLen = #tablefiedRoom[1]
    local yLen = #tablefiedRoom

    for index0, value0 in ipairs(tablefiedRoom) do
        for index, value in ipairs(tablefiedRoom[index0]) do
            local percentile = math.ceil(math.random() * 100)
            local part = value

            if part == " " and percentile >= 1 and percentile <= 5 then
                part = "~"
            end

            tablefiedRoom[index0][index] = part
        end
    end

    return tablefiedRoom
end


return mapgen