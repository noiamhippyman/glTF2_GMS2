/// @func __glTF_load_images
/// @args jsonData,filename,[bufferArray]
var jsonData = argument0;
var filename = argument1;

var images = [];
var imageList = jsonData[?"images"];
if (!is_undefined(imageList)) {
	var imageCount = ds_list_size(imageList);
	for (var i = 0; i < imageCount; ++i) {
		var imageData = imageList[|i];
		var uri = imageData[?"uri"];
		
		if (!is_undefined(uri)) {
			if (__glTF_uri_is_embedded(uri)) {
				var base64string = __glTF_uri_get_base64_string(uri);
				images[i] = buffer_base64_decode(base64string);
			} else {
				var imagePath = filename_path(filename) + uri;
				images[i] = buffer_load(imagePath);
			}
		} else {
			// glb file
			var glb = buffer_load(filename);
			
			var bufferViewIndex = imageData[?"bufferView"];
			var bufferViews = jsonData[?"bufferViews"];
			var bufferView = bufferViews[|bufferViewIndex];
			var bufferIndex = bufferView[?"buffer"];
			
			buffer_delete(glb);
		}
	}
}

return images;