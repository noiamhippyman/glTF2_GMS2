/// @func __glTF_json_parse_textures
/// @args texturesJsonData
var texturesJsonData = argument0;
var texturecount = ds_list_size(texturesJsonData);
var textures = [];

for (var i = 0; i < texturecount; ++i) {
	var texture = texturesJsonData[|i];
	var textureDataObject = __glTF_new_data_object();
	
	var tex_sampler = texture[?"sampler"];
	if (!is_undefined(tex_sampler)) {
		textureDataObject.sampler = tex_sampler;
	}
	
	var tex_source = texture[?"source"];
	if (!is_undefined(tex_source)) {
		textureDataObject.source = tex_source;
	}
	
	var tex_name = texture[?"name"];
	if (!is_undefined(tex_name)) {
		textureDataObject.name = tex_name;
	}
	
	textures[i] = textureDataObject;
}

return textures;