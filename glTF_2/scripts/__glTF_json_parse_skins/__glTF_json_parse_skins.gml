/// @func __glTF_json_parse_skins
/// @args skinsJsonData
var skinsJsonData = argument0;
var skincount = ds_list_size(skinsJsonData);
var skins = [];

for (var i = 0; i < skincount; ++i) {
	var skin = skinsJsonData[|i];
	var skinDataObject = __glTF_new_data_object();
	
	var skin_inverseBindMatrices = skin[?"inverseBindMatrices"];
	if (!is_undefined(skin_inverseBindMatrices)) {
		skinDataObject.inverseBindMatrices = skin_inverseBindMatrices;
	}
	
	var skin_skeleton = skin[?"skeleton"];
	if (!is_undefined(skin_skeleton)) {
		skinDataObject.skeleton = skin_skeleton;
	}
	
	var skin_joints = skin[?"joints"];
	if (!is_undefined(skin_joints)) {
		skinDataObject.joints = [];
		var jointcount = ds_list_size(skin_joints);
		for (var j = 0; j < jointcount; ++j) {
			skinDataObject.joints[j] = skin_joints[|i];
		}
	}
	
	var skin_name = skin[?"name"];
	if (!is_undefined(skin_name)) {
		skinDataObject.name = skin_name;
	}
	
	skins[i] = skinDataObject;
}

return skins;