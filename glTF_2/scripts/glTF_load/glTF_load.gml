/// @func glTF_load
/// @args filename
var filename = argument0;

if (!file_exists(filename)) {
	show_error(filename + " doesn't exist",true);
	// return ERROR_FILE_NOT_FOUND
}

var is_glb = filename_ext(filename) == ".glb";
var gltf_asset;
if (is_glb) {
	// loading glTF asset from glb file
	gltf_asset = __glTF_load_glb(filename);
} else {
	// loading glTF asset from gltf file
	gltf_asset = __glTF_load_gltf(filename);
}
return gltf_asset;