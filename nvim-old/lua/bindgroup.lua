
local make_mapper = function(mapper)
    return function(options, bindings)
        local props = { "mode", "keys", "cmd", "options", "category", "id", "description" }
        for _, bind in ipairs(bindings) do
            local args = {}
            for _, prop in ipairs(props) do
                table.insert(args, options[prop] or table.remove(bind, 1))
            end
            mapper(table.unpack(args))
        end
    end
end


local mapper = require('nvim-mapper')

return {
    map = make_mapper(mapper.map),
    map_virt = make_mapper(mapper.map_virtual)
}
