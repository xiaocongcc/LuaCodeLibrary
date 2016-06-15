local tbDefineValue = {}

setmetatable(_G, {
	__newindex = function(tb, key, value)
		tbDefineValue[key] = true
		rawset(tb, key, value)
	end,
	__index = function(tb, key)
		if not tbDefineValue[key] then
			error(string.format("找不到全局变量：%s", key))
			return nil
		end
	end
})

function getValue(key, default)
	local flag, value = pcall(function() return _G[key] end)
	if flag then
		return value
	else
		return default
	end
end

a = getValue('a', 111)
print(a)