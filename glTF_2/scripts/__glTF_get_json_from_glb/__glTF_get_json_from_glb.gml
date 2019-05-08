/// @func __glTF_get_json_from_glb
/// @args buffer
var glb = argument0;

buffer_seek(glb,buffer_seek_start,0);
var magic = buffer_read(glb,buffer_u32);
if (magic != 0x46546C67) {
	show_error("Not a valid glb file",true);
	// return ERROR_INVALID_GLB_FILE
}
//var version = buffer_read(glb,buffer_u32); // glTF version
//var glbLength = buffer_read(glb,buffer_u32); // length of entire buffer in bytes
buffer_seek(glb,buffer_seek_relative,8); // don't need glTF version or length of buffer so skip it
var jsonLength = buffer_read(glb,buffer_u32);
buffer_seek(glb,buffer_seek_relative,4); // chunkType is always JSON for the first chunk so skip it
var jsonString = "";
for (var i = 0; i < jsonLength; ++i) {
	jsonString += chr(buffer_read(glb,buffer_u8));
}

return jsonString;