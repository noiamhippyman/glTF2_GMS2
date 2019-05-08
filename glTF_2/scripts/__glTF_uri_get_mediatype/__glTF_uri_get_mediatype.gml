/// @func __glTF_uri_get_mediatype
/// @args uri
var uri = argument0;

var str = string_replace(uri,"data:","");
var len = string_length(str);

var retStr = "";
for (var i = 1; i <= len; ++i) {
	var char = string_char_at(str,i);
	if (char == ",") break;
	retStr += char;
}

return retStr;