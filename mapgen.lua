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

    return room
end


return mapgen