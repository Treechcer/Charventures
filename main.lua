math.randomseed(os.time())

love = require("love")
player = require("player")
mapgen = require("mapgen")

love.window.setMode(810, 600)

function love.load()
    colors = {
        darkGray = {0.32, 0.31, 0.35},
        yellow = {1.0, 1.0, 0.63},
        brown = {0.59, 0.29, 0.0}
    }

    map = mapgen.gen()

    local font = love.graphics.newFont("Press Start 2p - font/PressStart2P-Regular.ttf", 30)
    font:setLineHeight(0.7)
    love.graphics.setFont(font)
    
    counter = 0
end

function love.draw()
    --love.graphics.setFont(love.graphics.newFont(60))
    for index, value in ipairs(map) do
        for i = 1, #value do
            local char = value:sub(i,i)
            if char == "#" then
                love.graphics.setColor(colors.darkGray)
                love.graphics.print(char, 0 - player.camera.x + (i - 1) * player.height, 0 + (index - 1) * player.height - player.camera.y)
            elseif char == ")" or char == "(" or char == "V" or char == "^" then
                love.graphics.setColor(colors.brown)
                love.graphics.print(char, 0 - player.camera.x + (i - 1) * player.height, 0 + (index - 1) * player.height - player.camera.y)
            end
        end
    end

    love.graphics.setColor(colors.yellow)
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

    if counter >= player.cooldown then
        counter = 0
        player.canMove = true
    end

    counter = counter + dt
end