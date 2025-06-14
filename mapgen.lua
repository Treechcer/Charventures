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
        "############# #############",
    }

function mapgen.gen()
    -- 1) zdvojit každý řádek
    for index, value in ipairs(room) do
        room[index] = value .. value
    end

    -- 2) upravit znaky na začátku a konci
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