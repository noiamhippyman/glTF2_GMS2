/// @func __glTF_json_to_gltf_asset
/// @args jsonData
var jsonData = argument0;

var asset = jsonData[?"asset"];

if (is_undefined(asset) || asset[?"version"] != 2) {
	show_error("Not a valid gltf asset",true);
}

var scene = jsonData[?"scene"];
var scenes = jsonData[?"scenes"];
var nodes = jsonData[?"nodes"];
var meshes = jsonData[?"meshes"];
var accessors = jsonData[?"accessors"];
var buffers = jsonData[?"buffers"];
var bufferViews = jsonData[?"bufferViews"];

var gltf = __glTF_new_data_object();
if (!is_undefined(scene)) { gltf.scene = scene; }

#region Scenes
if (!is_undefined(scenes)) {
	var scenecount = ds_list_size(scenes);
	gltf.scenes = [];
	for (var i = 0; i < scenecount; ++i) {
		var _scene = scenes[|i];
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
		
		gltf.scenes[i] = sceneDataObject;
	}
}
//if (!is_undefined(scenes)) {
//	gltf.scenes = [];
//	var scenecount = ds_list_size(scenes);
//	for (var i = 0; i < scenecount; ++i) {
//		var _scene = scenes[|i];
//		var _nodes = _scene[?"nodes"];
//		var sceneDataObject = __glTF_new_data_object();
//		var nodecount = ds_list_size(_nodes);
//		for (var j = 0; j < nodecount; ++j) {
//			sceneDataObject.nodes[j] = _nodes[|j];
//		}
//		gltf.scenes[i] = sceneDataObject;
//	}
//}
#endregion

#region Nodes
if (!is_undefined(nodes)) {
	var nodecount = ds_list_size(nodes);
	gltf.nodes = [];
	for (var i = 0; i < nodecount; ++i) {
		var _node = nodes[|i];
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
		
		gltf.nodes[i] = nodeDataObject;
	}
}
#endregion

#region Meshes
if (!is_undefined(meshes)) {
	var meshcount = ds_list_size(meshes);
	gltf.meshes = [];
	for (var i = 0; i < meshcount; ++i) {
		var _mesh = meshes[|i];
		var meshDataObject = __glTF_new_data_object();
		
		var mesh_primitives = _mesh[?"primitives"];
		if (!is_undefined(mesh_primitives)) {
			var primitivecount = ds_list_size(mesh_primitives);
			meshDataObject.primitives = [];
			for (var j = 0; j < primitivecount; ++j) {
				var mesh_primitive = mesh_primitives[|j];
				var primitiveDataObject = __glTF_new_data_object();
				
				var primitive_attributes = mesh_primitive[?"attributes"];
				if (!is_undefined(primitive_attributes)) {
					primitiveDataObject.attributes = primitive_attributes;
				}
				
				var primitive_indices = mesh_primitive[?"indices"];
				if (!is_undefined(primitive_indices)) {
					primitiveDataObject.indices = primitive_indices;
				}
				
				var primitive_material = mesh_primitive[?"material"];
				if (!is_undefined(primitive_material)) {
					primitiveDataObject.material = primitive_material;
				}
				
				var primitive_mode = mesh_primitive[?"mode"];
				if (!is_undefined(primitive_mode)) {
					primitiveDataObject.mode = primitive_mode;
				}
				
				var primitive_targets = mesh_primitive[?"targets"];
				if (!is_undefined(primitive_targets)) {
					var primtargetcount = ds_list_size(primitive_targets);
					primitiveDataObject.targets = [];
					for (var k = 0; k < primtargetcount; ++k) {
						primitiveDataObject.targets[k] = primitive_targets[|k];
					}
				}
				
				
				meshDataObject.primitives[j] = primitiveDataObject;
			}
		}
		
		var mesh_weights = _mesh[?"weights"];
		if (!is_undefined(mesh_weights)) {
			var weightcount = ds_list_size(mesh_weights);
			meshDataObject.weights = [];
			for (var j = 0; j < weightcount; ++j) {
				var mesh_weight = mesh_weights[|j];
				meshDataObject.weights[j] = mesh_weight;
			}
		}
		
		var mesh_name = _mesh[?"name"];
		if (!is_undefined(mesh_name)) {
			meshDataObject.name = mesh_name;
		}
	
		gltf.meshes[i] = meshDataObject;
	}
}
#endregion

#region Accessors
if (!is_undefined(accessors)) {
	var accessorcount = ds_list_size(accessors);
	gltf.accessors = [];
	for (var i = 0; i < accessorcount; ++i) {
		var _accessor = accessors[|i];
		var accessorDataObject = __glTF_new_data_object();
		
		var accessor_bufferView = _accessor[?"bufferView"];
		if (!is_undefined(accessor_bufferView)) {
			accessorDataObject.bufferView = accessor_bufferView;
		}
		
		var accessor_byteOffset = _accessor[?"byteOffset"];
		if (!is_undefined(accessor_byteOffset)) {
			accessorDataObject.byteOffset = accessor_byteOffset;
		}
		
		var accessor_componentType = _accessor[?"componentType"];
		if (!is_undefined(accessor_componentType)) {
			accessorDataObject.componentType = accessor_componentType;
		}
		
		var accessor_count = _accessor[?"count"];
		if (!is_undefined(accessor_count)) {
			accessorDataObject.count = accessor_count;
		}
		
		var accessor_type = _accessor[?"type"];
		if (!is_undefined(accessor_type)) {
			accessorDataObject.type = accessor_type;
		}
		
		var accessor_min = _accessor[?"min"];
		if (!is_undefined(accessor_min)) {
			var mincount = ds_list_size(accessor_min);
			accessorDataObject.minValues = []
			for (var j = 0; j < mincount; ++j) {
				accessorDataObject.minValues[j] = accessor_min[|j];
			}
		}
		
		var accessor_max = _accessor[?"max"];
		if (!is_undefined(accessor_max)) {
			var maxcount = ds_list_size(accessor_max);
			accessorDataObject.maxValues = []
			for (var j = 0; j < maxcount; ++j) {
				accessorDataObject.maxValues[j] = accessor_max[|j];
			}
		}
		
		// TODO: Sparse accessors
		
		gltf.accessors[i] = accessorDataObject;
	}
}
#endregion

#region Buffers
if (!is_undefined(buffers)) {
	var buffercount = ds_list_size(buffers);
	gltf.buffers = [];
	for (var i = 0; i < buffercount; ++i) {
		var _buffer = buffers[|i];
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
		
		gltf.buffers[i] = bufferDataObject;
	}
}
#endregion

#region Buffer Views
if (!is_undefined(bufferViews)) {
	var bufferviewcount = ds_list_size(bufferViews);
	gltf.bufferViews = [];
	for (var i = 0; i < bufferviewcount; ++i) {
		var _bufferView = bufferViews[|i];
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
		
		gltf.bufferViews[i] = bufferViewDataObject;
	}
}
#endregion

return gltf;