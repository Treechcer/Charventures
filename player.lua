height = 30
player = {
    camera = {
        x = 0,
        y = 0
    },
    height = height,
    x = height,
    y = height,
    canMove = true,
    tilex = 1,
    tiley = 1,
    cooldown = 0.2
}

function player.move(m, map)
    counter = 0

    player.x = player.x + (1 * m.x * player.height)
    player.y = player.y + (1 * m.y * player.height)

    player.tilex = (player.x - player.camera.x) / player.height + 1
    player.tiley = (player.y + player.camera.y) / player.height + 1

    player.canMove = false

    print("DEBUG: tilex = ", player.tilex)
    print("DEBUG: tiley = ", player.tiley)
    print("DEBUG: cam Y = ", player.camera.y)
    print("DEBUG: y = ", player.y)
    print("DEBUG: map[player.tiley] = ", map[player.tiley])
    if string.sub(map[player.tiley], player.tilex, player.tilex) == "#" then
        player.x = player.x - (1 * m.x * player.height)
        player.y = player.y - (1 * m.y * player.height)
        
        player.tilex = (player.x - player.camera.x) / player.height + 1
        player.tiley = (player.y + player.camera.y) / player.height + 1
    end

    if player.x == 810 then
        player.cameraMove({x = 810, y = 0})
        player.x = player.x - 810
        player.tilex = (player.x) / player.height + 1
    elseif player.x <= 0 then
        local bonus = 0
        if (player.x < 0) then
            bonus = player.height
        end
        player.cameraMove({x = -810, y = 0})
        player.x = player.x + 810 - player.height + bonus
        player.tilex = (player.x) / player.height + 1
    end

    if player.y == 600 then
        player.cameraMove({x = 0, y = 600})
        player.y = player.y - 600
        player.tiley = (player.y) / player.height + 1
    elseif player.y <= 0 then
        local bonus = 0
        if (player.y < 0) then
            bonus = player.height
        end
        player.cameraMove({x = 0, y = -600})
        player.y = player.y + 600 - player.height + bonus
        player.tiley = (player.y) / player.height + 1
    end
end

function player.cameraMove(px)
    player.camera.x = player.camera.x + px.x
    player.camera.y = player.camera.y + px.y
end

return player