errors = {}

function error(message, object)
    print(message, ":", dump(object))
    table.insert(errors, {
        message = message,
        details = dump(object),
        frames = 600
    })
end
