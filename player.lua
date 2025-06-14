height = 30
player = {
    camera = {

    },
    height = height,
    x = height,
    y = height,
}

function player.move(m)
    player.x = player.x + (1 * m.x * player.height)
end

return player