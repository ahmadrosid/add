input = arg[1]
paths = {}

if input == nil
	print "Please type filename"
	do return

is_dir = (name) -> 
	os.rename(name, name) and true or false

mkdir = (path) -> os.execute "mkdir " .. path

mkfile = (path) -> 
	io.open path, "w" 

for path in string.gmatch input, "[^/]+"
	paths[#paths+1] = path

if #paths == 1 
	if string.match input,"/"
		mkdir input
	else
		mkfile(input)

dir_paths = ""
for index, value in ipairs paths
	if index == #paths
		if string.sub(input, #input, #input) == "/"
			mkdir input
		else
			mkfile dir_paths .. value
	else
		dir_paths = dir_paths .. value .. "/"
		if not is_dir dir_paths
			mkdir dir_paths
