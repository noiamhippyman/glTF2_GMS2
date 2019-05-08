/// @func __glTF_json_parse_buffers
/// @args buffersJsonData
var buffersJsonData = argument0;
var buffercount = ds_list_size(buffersJsonData);
var buffers = [];
for (var i = 0; i < buffercount; ++i) {
	var _buffer = buffersJsonData[|i];
	var bufferDataObject = __glTF_new_data_object();
	var buffer_uri = _buffer[?"uri"];
	if (!is_undefined(buffer_uri)) {
		bufferDataObject.uri = buffer_uri;
	}
		
	var buffer_byteLength = _buffer[?"byteLength"];
	if (!is_undefined(buffer_byteLength)) {
		bufferDataObject.byteLength = buffer_byteLength;
	}
		
	var buffer_name = _buffer[?"name"];
	if (!is_undefined(buffer_name)) {
		bufferDataObject.name = buffer_name;
	}
		
	buffers[i] = bufferDataObject;
}

return buffers;