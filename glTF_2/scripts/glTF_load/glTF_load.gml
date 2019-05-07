/// @func glTF_load
/// @args filename
var filename = argument0;

if (!file_exists(filename)) {
	show_error(filename + " doesn't exist",true);
	// return ERROR_FILE_NOT_FOUND
}

var jsonString = __glTF_get_json_string(filename);
var jsonData = json_decode(jsonString);

var buffers = __glTF_load_buffers(jsonData,filename);

var images = [];
//var imageCount = ds_list_size(jsonImages);
//for (var i = 0; i < imageCount; ++i) {
//	images[i] = jsonImages[|i];
//}

var gltf = [];
gltf[eGLTF.JSON] = jsonData;
gltf[eGLTF.Buffers] = buffers;
gltf[eGLTF.Images] = images;
return gltf;