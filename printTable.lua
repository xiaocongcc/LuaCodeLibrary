function print_table(tb)
    if type(tb) ~= "table" then
        print(tb)
        return
    end
    local str = ""
    local tab = "    "
    local count = -1
    local function _print(t)
        count = count + 1
        local temp = ""
        local tmp = tab
        for i = 1, count do
            temp = string.format("%s%s", temp, tab)
            tmp = string.format("%s%s", tmp, tab)
        end
        if type(t) ~= "table" then
            local data = tostring(t)
			if type(t) == "string" then
				data = string.format("\"%s\"", data)
			end
            str = string.format("%s%s,\n", str, data)
            count = count - 1
            return
        end

        str = string.format("%s\n%s{\n", str, temp)
        for i, v in pairs(t) do
            local key = tostring(i)
            if type(i) == "string" then
                key = string.format("\"%s\"", key)
            end
            str = string.format("%s%s[%s] = ", str, tmp, key)
            _print(v)
        end
        str = string.format("%s%s},\n", str, temp)
        count = count - 1
    end
    _print(tb)
	return str
end