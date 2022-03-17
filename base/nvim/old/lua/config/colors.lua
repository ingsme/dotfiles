local base16 = require('base16')
local theme = base16.theme_from_array {
	"282828"; "404040"; "606060"; "8F8F8F";
	"5D5D5D"; "F7F7F7"; "c0c0c0"; "ffffff";
	"D1FA71"; "dfaf8f"; "e0cf9f"; "F6DC69";
	"93e0e3"; "7cb8bb"; "D1FA71"; "000000";
}

base16(theme, true)
