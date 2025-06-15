mapgen = {

}

room = {
        "###########################",
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

    for index, value in ipairs(room) do
        if string.sub(value, 1, 1) == "(" then
            value = "#" .. string.sub(value, 2)
        end

        if string.sub(value, -1) == ")" then
            value = string.sub(value, 1, -2) .. "#"
        end

        room[index] = value
    end

    return room
end


return mapgen