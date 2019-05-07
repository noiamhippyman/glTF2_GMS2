/// @func __glTF_get_json_from_gltf
/// @args filename
/// @desc This script is usually just "json_to_string" and can literally be used on any json file. Just renamed to "__glTF_get_json_from_gltf" for consistency.
var filename = argument0;
var gltf = buffer_load(filename);
var size = buffer_get_size(gltf);
var jsonString = "";

buffer_seek(gltf,buffer_seek_start,0);

for (var i = 0; i < size; ++i) {
	jsonString += chr(buffer_read(gltf,buffer_u8));
}

buffer_delete(gltf);

return jsonString