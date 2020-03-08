local input = arg[1]
local paths = { }
if input == nil then
  print("Please type filename")
  do
    return 
  end
end
local is_dir
is_dir = function(name)
  return os.rename(name, name) and true or false
end
local mkdir
mkdir = function(path)
  return os.execute("mkdir " .. path)
end
local mkfile
mkfile = function(path)
  return io.open(path, "w")
end
for path in string.gmatch(input, "[^/]+") do
  paths[#paths + 1] = path
end
if #paths == 1 then
  if string.match(input, "/") then
    mkdir(input)
  else
    mkfile(input)
  end
end
local dir_paths = ""
for index, value in ipairs(paths) do
  if index == #paths then
    if string.sub(input, #input, #input) == "/" then
      mkdir(input)
    else
      mkfile(dir_paths .. value)
    end
  else
    dir_paths = dir_paths .. value .. "/"
    if not is_dir(dir_paths) then
      mkdir(dir_paths)
    end
  end
end
