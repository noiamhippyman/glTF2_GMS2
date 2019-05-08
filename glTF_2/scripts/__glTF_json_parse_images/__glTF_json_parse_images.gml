/// @func __glTF_json_parse_images
/// @args imagesJsonData
var imagesJsonData = argument0;
var imagecount = ds_list_size(imagesJsonData);
var images = [];
for (var i = 0; i < imagecount; ++i) {
	var image = imagesJsonData[|i];
	var imgDataObject = __glTF_new_data_object();
	
	var image_uri = image[?"uri"];
	if (!is_undefined(image_uri)) {
		imgDataObject.uri = image_uri;
	}
	
	var image_mimeType = image[?"mimeType"];
	if (!is_undefined(image_mimeType)) {
		imgDataObject.mimeType = image_mimeType;
	}
	
	var image_bufferView = image[?"bufferView"];
	if (!is_undefined(image_bufferView)) {
		imgDataObject.bufferView = image_bufferView;
	}
	
	var image_name = image[?"name"];
	if (!is_undefined(image_name)) {
		imgDataObject.name = image_name;
	}
	
	images[i] = imgDataObject;
}

return images;