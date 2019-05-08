/// @func __glTF_json_parse_nodes
/// @args nodesJsonData
var nodesJsonData = argument0;
var nodecount = ds_list_size(nodesJsonData);
var nodes = [];
for (var i = 0; i < nodecount; ++i) {
	var _node = nodesJsonData[|i];
	var nodeDataObject = __glTF_new_data_object();
		
	var node_camera = _node[?"camera"];
	if (!is_undefined(node_camera)) {
		nodeDataObject.camera = node_camera;
	}
		
	var node_children = _node[?"children"];
	if (!is_undefined(node_children)) {
		nodeDataObject.children = [];
		var childcount = ds_list_size(node_children);
		for (var j = 0; j < childcount; ++j) {
			nodeDataObject.children[j] = node_children[|j];
		}
	}
		
	var node_skin = _node[?"skin"];
	if (!is_undefined(node_skin)) {
		nodeDataObject.skin = node_skin;
	}
		
	var node_matrix =_node[?"matrix"];
	if (!is_undefined(node_matrix)) {
		nodeDataObject.matrix = [];
		for (var j = 0; j < 16; ++j) {
			nodeDataObject.matrix[j] = node_matrix[|j];
		}
	}
		
	var node_mesh = _node[?"mesh"];
	if (!is_undefined(node_mesh)) {
		nodeDataObject.mesh = node_mesh;
	}
		
	var node_rotation = _node[?"rotation"];
	if (!is_undefined(node_rotation)) {
		nodeDataObject.rotation = [];
		for (var j = 0; j < 4; ++j) {
			nodeDataObject.rotation[j] = node_rotation[|j];
		}
	}
		
	var node_scale = _node[?"scale"];
	if (!is_undefined(node_scale)) {
		nodeDataObject.scale = [];
		for (var j = 0; j < 3; ++j) {
			nodeDataObject.scale[j] = node_scale[|j];
		}
	}
		
	var node_translation = _node[?"translation"];
	if (!is_undefined(node_translation)) {
		nodeDataObject.translation = [];
		for (var j = 0; j < 3; ++j) {
			nodeDataObject.translation[j] = node_translation[|j];
		}
	}
		
	var node_weights = _node[?"weights"];
	if (!is_undefined(node_weights)) {
		nodeDataObject.weights = [];
		var weightcount = ds_list_size(node_weights);
		for (var j = 0; j < weightcount; ++j) {
			nodeDataObject.weights[j] = node_weights[|j];
		}
	}
		
	var node_name = _node[?"name"];
	if (!is_undefined(node_name)) {
		nodeDataObject.name = node_name;
	}
		
	nodes[i] = nodeDataObject;
}

return nodes;