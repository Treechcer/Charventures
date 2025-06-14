love = require("love")
player = require("player")

function love.load()
    map = {
        "###########################",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "#                         #",
        "###########################",
    }

    local font = love.graphics.newFont("Press Start 2p - font/PressStart2P-Regular.ttf", 30)
    font:setLineHeight(0.7)
    love.graphics.setFont(font)
    
    counter = 0
end

function love.draw()
    --love.graphics.setFont(love.graphics.newFont(60))
    for index, value in ipairs(map) do
        love.graphics.print(value, 0, 0 + (index - 1) * 30)
    end

    love.graphics.print("@", player.x, player.y)
end

function love.update(dt)

    if counter >= 1 then
        counter = 0
        player.move({x = 1, y = 1})
    end

    counter = counter + dt
end