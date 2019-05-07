/// @func __glTF_load_buffers
/// @args jsonData,filename
var jsonData = argument0;
var filename = argument1;

var bufferList = jsonData[?"buffers"];
var buffers = [];
var bufferCount = ds_list_size(bufferList);
for (var i = 0; i < bufferCount; ++i) {
	var bufferData = bufferList[|i];
	var length = bufferData[?"byteLength"];
	//var type = bufferData[?"type"];
	var uri = bufferData[?"uri"];
	
	var buffer = buffer_create(length,buffer_fixed,1);
	
	if (!is_undefined(uri)) {
		if (__glTF_uri_is_embedded(uri)) {
			var base64string = __glTF_uri_get_base64_string(uri);
			buffer_base64_decode_ext(buffer,base64string,0);
		} else {
			var bufferPath = filename_path(filename) + uri;
			buffer_load_ext(buffer,bufferPath,0);
		}
		//buffers[i] = buffer;
	} else {// it's a glb file
		// TODO: follow glb format specs
		// I KNOW it's inefficient to load it twice.
		// I'll figure it out later!
		var glb = buffer_load(filename);
		
		buffer_seek(glb,buffer_seek_start,12);
		var jsonLength = buffer_read(glb,buffer_u32);
		//buffer_seek(glb,buffer_seek_relative,jsonLength+4);
		
		//var binChunkLength = buffer_read(glb,buffer_u32);
		//show_message("Bin length test: "+ string((binChunkLength ==length) ? "true" : "false"));
		
		//var binChunkType = buffer_read(glb,buffer_u32);
		//show_message("Bin type test: " + string((binChunkType == 0x004E4942) ? "true" : "false"));
		buffer_copy(glb,jsonLength+28,length,buffer,0);
		
		buffer_delete(glb);
	}
	
	buffers[i] = buffer;
}

return buffers;