love = require("love")
player = require("player")

love.window.setMode(810, 600)

function love.load()
    map = {
        "############################",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                          ",
        "#                          ",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "#                         ##",
        "############# ##############",
        "############# ##############",
        "#                         ##",
    }

    local font = love.graphics.newFont("Press Start 2p - font/PressStart2P-Regular.ttf", 30)
    font:setLineHeight(0.7)
    love.graphics.setFont(font)
    
    counter = 0
end

function love.draw()
    --love.graphics.setFont(love.graphics.newFont(60))
    for index, value in ipairs(map) do
        love.graphics.print(value, 0 - player.camera.x, 0 + (index - 1) * 30 - player.camera.y)
    end

    love.graphics.print("@", player.x, player.y)
end

function love.update(dt)

    if love.keyboard.isDown("a") and player.canMove then
        player.move({x = -1, y = 0}, map)
    elseif love.keyboard.isDown("d") and player.canMove then
        player.move({x = 1, y = 0}, map)
    elseif love.keyboard.isDown("w") and player.canMove then
        player.move({x = 0, y = -1}, map)
    elseif love.keyboard.isDown("s") and player.canMove then
        player.move({x = 0, y = 1}, map)
    end

    if counter >= 0.1 then
        counter = 0
        player.canMove = true
    end

    counter = counter + dt
end