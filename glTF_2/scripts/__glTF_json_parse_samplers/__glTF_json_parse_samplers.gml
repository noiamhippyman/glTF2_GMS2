/// @func __glTF_json_parse_samplers
/// @args samplersJsonData
var samplersJsonData = argument0;
var samplercount = ds_list_size(samplersJsonData);
var samplers = [];

for (var i = 0; i < samplercount; ++i) {
	var sampler = samplersJsonData[|i];
	var samplerDataObject = __glTF_new_data_object();
	
	var sampler_magFilter = sampler[?"magFilter"];
	if (!is_undefined(sampler_magFilter)) {
		samplerDataObject.magFilter = sampler_magFilter;
	}
	
	var sampler_minFilter = sampler[?"minFilter"];
	if (!is_undefined(sampler_minFilter)) {
		samplerDataObject.minFilter = sampler_minFilter;
	}
	
	var sampler_wrapS = sampler[?"wrapS"];
	if (!is_undefined(sampler_wrapS)) {
		samplerDataObject.wrapS = sampler_wrapS;
	}
	
	var sampler_wrapT = sampler[?"wrapT"];
	if (!is_undefined(sampler_wrapT)) {
		samplerDataObject.wrapT = sampler_wrapT;
	}
	
	var sampler_name = sampler[?"name"];
	if (!is_undefined(sampler_name)) {
		samplerDataObject.name = sampler_name;
	}
	
	samplers[i] = samplerDataObject;
}

return samplers;