/// @func glTF_load
/// @args filename
var filename = argument0;

if (!file_exists(filename)) {
	show_error(filename + " doesn't exist",true);
	// return ERROR_FILE_NOT_FOUND
}

// if this is .glb file
if (filename_ext(filename) == ".glb") {
	// loading glTF asset from glb file
	return __glTF_load_glb(filename);
} else {
	// loading glTF asset from gltf file
	return __glTF_load_gltf(filename);
}