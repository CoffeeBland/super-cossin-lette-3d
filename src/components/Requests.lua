Requests = {}

function Requests.new(game)
    game.entities = {}
    game.entitiesByName = {}
    game.entitiesByComponent = {
        actor = {},
        shakeEmitter = {},
        soundEmitter = {},
        particleEmitter = {},
        fruitStack = {},
        picnic = {},
        fruit = {},
        velocity = {},
        water = {},
        anim = {},
        bubble = {},
        larp = {},
        lens = {}
    }
end

function Requests.populate(game)
    for key, entity in pairs(game.entities) do
        if entity.name then
            game.entitiesByName[entity.name] = entity
        end
        for componentKey, _ in pairs(entity) do
            if game.entitiesByComponent[componentKey] then
                table.insert(game.entitiesByComponent[componentKey], entity)
            end
        end
    end
end
