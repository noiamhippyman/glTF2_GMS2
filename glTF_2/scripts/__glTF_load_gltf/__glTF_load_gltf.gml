/// @func __glTF_load_gltf
/// @args filename
var filename = argument0;
var jsonString = __glTF_get_json_from_gltf(filename);
var jsonData = json_decode(jsonString);

return __glTF_gltf_asset_create(jsonData);