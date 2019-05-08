/// @func __glTF_json_parse_accessors
/// @args accessorsJsonData
var accessorsJsonData = argument0;

var accessorcount = ds_list_size(accessorsJsonData);
var accessors = [];
for (var i = 0; i < accessorcount; ++i) {
	var _accessor = accessorsJsonData[|i];
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
		
	#region Sparse accessors
	var accessor_sparse = _accessor[?"sparse"];
	if (!is_undefined(accessor_sparse)) {
		var sparseDataObject = __glTF_new_data_object();
			
		var sparse_count = accessor_sparse[?"count"];
		if (!is_undefined(sparse_count)) {
			sparseDataObject.count = sparse_count;
		}
			
		var sparse_indices = accessor_sparse[?"indices"];
		if (!is_undefined(sparse_indices)) {
			var indicesDataObject = __glTF_new_data_object();
				
			var indices_bufferView = sparse_indices[?"bufferView"];
			if (!is_undefined(indices_bufferView)) {
				indicesDataObject.bufferView = indices_bufferView;
			}
				
			var indices_byteOffset = sparse_indices[?"byteOffset"];
			if (!is_undefined(indices_byteOffset)) {
				indicesDataObject.byteOffset = indices_byteOffset;
			}
				
			var indices_componentType = sparse_indices[?"componentType"];
			if (!is_undefined(indices_componentType)) {
				indicesDataObject.componentType = indices_componentType;
			}
				
			sparseDataObject.indices = indicesDataObject;
		}
			
		var sparse_values = accessor_sparse[?"values"];
		if (!is_undefined(sparse_values)) {
			var valuesDataObject = __glTF_new_data_object();
				
			var values_bufferView = sparse_values[?"bufferView"];
			if (!is_undefined(values_bufferView)) {
				valuesDataObject.bufferView = values_bufferView;
			}
				
			var values_byteOffset = sparse_values[?"byteOffset"];
			if (!is_undefined(values_byteOffset)) {
				valuesDataObject.byteOffset = values_byteOffset;
			}
				
			sparseDataObject.values = valuesDataObject;
		}
			
		accessorDataObject.sparse = sparseDataObject;
	}
	#endregion Sparse
	
	var accessor_name = _accessor[?"name"];
	if (!is_undefined(accessor_name)) {
		accessorDataObject.name = accessor_name;
	}
	
	accessors[i] = accessorDataObject;
}

return accessors;