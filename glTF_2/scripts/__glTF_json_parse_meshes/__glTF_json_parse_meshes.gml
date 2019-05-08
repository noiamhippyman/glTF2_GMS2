/// @func __glTF_json_parse_meshes
/// @args meshesJsonData
var meshesJsonData = argument0;
var meshcount = ds_list_size(meshesJsonData);
var meshes = [];
for (var i = 0; i < meshcount; ++i) {
	var _mesh = meshesJsonData[|i];
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
					// TODO: make primitive target data object. not sure if needed yet
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
	
	meshes[i] = meshDataObject;
}

return meshes;