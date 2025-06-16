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
    for _ = 1, 2, 1 do
        for index, value in ipairs(room) do
            room[index] = value .. value
        end
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

    return room
end


return mapgen