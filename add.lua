local input = arg[1]
local paths = {}

local function is_dir(name)
	return os.rename(name,name) and true or false
end

if not input then
	print("please type filename")
	do return end
end

for path in string.gmatch(input, "[^/]+") do
	paths[#paths + 1] = path
end

if #paths == 1 then
	if string.match(input, "/") then
		os.execute("mkdir " .. input)
	else
		io.open(input, "w")
	end
end

local dir_paths = ""
for index, value in ipairs(paths) do
	if index == #paths then
		io.open(dir_paths .. value, "w")
	else
		dir_paths = dir_paths .. value .. "/"
		if not is_dir(dir_paths) then
			os.execute("mkdir " .. dir_paths)
		end
	end
end
