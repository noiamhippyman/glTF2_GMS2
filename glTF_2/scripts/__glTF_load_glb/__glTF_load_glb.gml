/// @func __glTF_load_glb
/// @args filename
var filename = argument0;
var glb = buffer_load(filename);
var jsonString = __glTF_get_json_from_glb(glb);
var jsonData = json_decode(jsonString);

return __glTF_json_to_gltf_asset(jsonData);