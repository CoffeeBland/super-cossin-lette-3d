errors = {}

function error(message, object)
    print(message, object and (": " .. dump(object)) or "")
    table.insert(errors, {
        message = message,
        details = object and dump(object),
        frames = 600
    })

    if #errors > 20 then
        table.clear(errors)
    end
end
