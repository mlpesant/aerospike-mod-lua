function new(r,bin,...)
    local m = map()
    local len = select('#',...)
    
    if len % 2 > 0 then error("odd number of elements") end

    for i=1, len do
        if i % 2 == 1 then
            local k = select(i,...)
            local v = select(i+1,...)
            m[k] = v
        end
    end

    r[bin] = m

    return r[bin]
end

function set(r,k,v)
    local m = map()
    m[k] = v
    return m[k]
end

function get(r,bin,key)
    local m = r[bin]
    return m[key]
end

function newmap(r,bin,a,b,c)
    local m = map {a=a,b=b,c=c}
    info("%s => %s", "a", m.a or "<nil>")
    info("%s => %s", "b", m.b or "<nil>")
    info("%s => %s", "b", m.c or "<nil>")
    return m["b"]
end

function putmap(r,bin,a,b,c)
    r[bin] = map{a=a, b=b, c=c}
    aerospike:create(r);
    return r[bin]["a"]
end

function getmap(r,bin,key)
    return r[bin][key]
end
