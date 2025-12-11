return function(object)
    return {
        name = "picnic",
        picnic = {
            dropRange = object.dropRange,
            fruits = {},
            stackDropJumpSpeed = 120,
            pickupJumpSpeed = 120,
            pickupAnimFrames = 20,
            dropCooldown = 21
        },
        anim = {},
        lens = { size = 640, size2 = 640^2 },
    }
end
