/// @func __glTF_uri_get_base64_string
/// @args uri
var uri = argument0;

var mediatype = __glTF_uri_get_mediatype(uri);

return string_replace(uri,"data:"+mediatype+",","");