--!strict

local LMS_R = vector.create(0.4122214708, 0.5363325363, 0.0514459929)
local LMS_G = vector.create(0.2119034982, 0.6806995451, 0.1073969566)
local LMS_B = vector.create(0.0883024619, 0.2817188376, 0.6299787005)

local Oklab = {}

function Oklab.fromSRGB(c: vector): vector
	local l = vector.dot(c, LMS_R) ^ (1 / 3)
	local m = vector.dot(c, LMS_G) ^ (1 / 3)
	local s = vector.dot(c, LMS_B) ^ (1 / 3)

	return vector.create(
		0.2104542553 * l + 0.7936177850 * m - 0.0040720468 * s,
		1.9779984951 * l - 2.4285922050 * m + 0.4505937099 * s,
		0.0259040371 * l + 0.7827717662 * m - 0.8086757660 * s
	)
end

function Oklab.toSRGB(c: vector): vector
	local L = c.x
	local a = c.y
	local b = c.z

	local l = (L + 0.3963377774 * a + 0.2158037573 * b) ^ 3
	local m = (L + 0.1055613458 * a + 0.0638541728 * b) ^ 3
	local s = (L + 0.0894841775 * a + 0.2914855480 * b) ^ 3

	return vector.create(
		 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
		-1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
		-0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s
	)
end

return Oklab
