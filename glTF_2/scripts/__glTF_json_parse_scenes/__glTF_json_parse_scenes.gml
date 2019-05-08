/// @func __glTF_json_parse_scenes
/// @args scenesJsonData
var scenesJsonData = argument0;
var scenecount = ds_list_size(scenesJsonData);
var scenes = [];
for (var i = 0; i < scenecount; ++i) {
	var _scene = scenesJsonData[|i];
	var sceneDataObject = __glTF_new_data_object();
		
	var scene_nodes = _scene[?"nodes"];
	if (!is_undefined(scene_nodes)) {
		var nodecount = ds_list_size(scene_nodes);
		sceneDataObject.nodes = [];
		for (var j = 0; j < nodecount; ++j) {
			sceneDataObject.nodes[j] = scene_nodes[|j];
		}
	}
		
	var scene_name = _scene[?"name"];
	if (!is_undefined(scene_name)) {
		sceneDataObject.name = scene_name;
	}
		
	scenes[i] = sceneDataObject;
}

return scenes;