/// @func __glTF_get_json_string
/// @args filename
var filename = argument0;
var filetype = filename_ext(filename);
switch (filetype) {
	case ".gltf":
		return __glTF_get_json_from_gltf(filename);
	break;
	
	case ".glb":
		return __glTF_get_json_from_glb(filename);
	break;
	
	default:
		return undefined;
	break;
}