/// @func __glTF_json_parse_bufferViews
/// @args bufferViewsJsonData
var bufferViewsJsonData = argument0;
var bufferviewcount = ds_list_size(bufferViewsJsonData);
var bufferViews = [];
for (var i = 0; i < bufferviewcount; ++i) {
	var _bufferView = bufferViewsJsonData[|i];
	var bufferViewDataObject = __glTF_new_data_object();
		
	var bufferView_buffer = _bufferView[?"buffer"];
	if (!is_undefined(bufferView_buffer)) {
		bufferViewDataObject.buffer = bufferView_buffer;
	}
		
	var bufferView_byteOffset = _bufferView[?"byteOffset"];
	if (!is_undefined(bufferView_byteOffset)) {
		bufferViewDataObject.byteOffset = bufferView_byteOffset;
	}
		
	var bufferView_byteLength = _bufferView[?"byteLength"];
	if (!is_undefined(bufferView_byteLength)) {
		bufferViewDataObject.byteLength = bufferView_byteLength;
	}
		
	var bufferView_byteStride = _bufferView[?"byteStride"];
	if (!is_undefined(bufferView_byteStride)) {
		bufferViewDataObject.byteStride = bufferView_byteStride;
	}
		
	var bufferView_name	= _bufferView[?"name"];
	if (!is_undefined(bufferView_name)) {
		bufferViewDataObject.name = bufferView_name;
	}
		
	bufferViews[i] = bufferViewDataObject;
}

return bufferViews;