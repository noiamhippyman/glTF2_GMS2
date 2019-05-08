/// @func __glTF_json_parse_animations
/// @args animationsJsonData
var animationsJsonData = argument0;
var animcount = ds_list_size(animationsJsonData);
var animations = [];
for (var i = 0; i < animcount; ++i) {
	var _animation = animationsJsonData[|i];
	var animDataObject = __glTF_new_data_object();
		
	var anim_channels = _animation[?"channels"];
	if (!is_undefined(anim_channels)) {
		var channelcount = ds_list_size(anim_channels);
		animDataObject.channels = [];
		for (var j = 0; j < channelcount; ++j) {
			var _channel = anim_channels[|j];
			var channelDataObject = __glTF_new_data_object();
				
			var channel_sampler = _channel[?"sampler"];
			if (!is_undefined(channel_sampler)) {
				channelDataObject.sampler = channel_sampler;
			}
				
			var channel_target = _channel[?"target"];
			if (!is_undefined(channel_target)) {
				var targetDataObject = __glTF_new_data_object();
					
				var target_node = channel_target[?"node"];
				if (!is_undefined(target_node)) {
					targetDataObject.node = target_node;
				}
					
				var target_path = channel_target[?"path"];
				if (!is_undefined(target_path)) {
					targetDataObject.path = target_path;
				}
					
				channelDataObject.target = targetDataObject;
			}
				
			animDataObject.channels[j] = channelDataObject;
		}
	}
		
	var anim_samplers = _animation[?"samplers"];
	if (!is_undefined(anim_samplers)) {
		var samplercount = ds_list_size(anim_samplers);
		animDataObject.samplers = [];
		for (var j = 0; j < samplercount; ++j) {
			var _sampler = anim_samplers[|j];
			var samplerDataObject = __glTF_new_data_object();
				
			var sampler_input = _sampler[?"input"];
			if (!is_undefined(sampler_input)) {
				samplerDataObject.input = sampler_input;
			}
				
			var sampler_interpolation = _sampler[?"interpolation"];
			if (!is_undefined(sampler_interpolation)) {
				samplerDataObject.interpolation = sampler_interpolation;
			}
				
			var sampler_output = _sampler[?"output"];
			if (!is_undefined(sampler_output)) {
				samplerDataObject.output = sampler_output;
			}
				
			animDataObject.samplers[j] = samplerDataObject;
		}
	}
		
	var anim_name = _animation[?"name"];
	if (!is_undefined(anim_name)) {
		animDataObject.name = anim_name;
	}
		
	animations[i] = animDataObject;
}

return animations;