/// @func __glTF_uri_is_embedded
/// @args uri
var uri = argument0;

return string_count("data:",uri) == 1;