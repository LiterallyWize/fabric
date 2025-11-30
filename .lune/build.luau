local process = require("@lune/process")
local fs = require("@lune/fs")

local RELEASE_DIR = "release"

local function build(): ()
	fs.writeDir(RELEASE_DIR)

	local result = process.exec("rojo", {
		"build", "--output", `{RELEASE_DIR}/Fabric.rbxm`
	})
	assert(result.ok, result.stderr)
end

local clock = os.clock()
build()

print(string.format("build completed in %.2fs", os.clock() - clock))