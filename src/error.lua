errors = {}

function error(message, object)
    print(message, ":", dump(object))
    table.insert(errors, {
        message = message,
        details = dump(object, { sep = "" }),
        frames = 120
    })
end
