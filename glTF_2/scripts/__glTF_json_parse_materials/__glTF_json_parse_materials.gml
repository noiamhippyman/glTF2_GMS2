/// @func __glTF_json_parse_materials
/// @args materialsJsonData
var materialsJsonData = argument0;
var materialcount = ds_list_size(materialsJsonData);
var materials = [];
for (var i = 0; i < materialcount; ++i) {
	var _material = materialsJsonData[|i];
	var materialDataObject = __glTF_new_data_object();
		
	var mat_name = _material[?"name"];
	if (!is_undefined(mat_name)) {
		materialDataObject.name = mat_name;
	}
		
	#region PBR Metallic Roughness		
	var mat_pbrMetRough =_material[?"pbrMetallicRoughness"];
	if (!is_undefined(mat_pbrMetRough)) {
		var pbrMetRoughDataObject = __glTF_new_data_object();
			
		var pbr_baseColorFactor = mat_pbrMetRough[?"baseColorFactor"];
		if (!is_undefined(pbr_baseColorFactor)) {
			pbrMetRoughDataObject.baseColorFactor = [];
			for (var j = 0; j < 4; ++j) {
				pbrMetRoughDataObject.baseColorFactor[j] = pbr_baseColorFactor[|j];
			}
		}
			
		var pbr_baseColorTexture = mat_pbrMetRough[?"baseColorTexture"];
		if (!is_undefined(pbr_baseColorTexture)) {
			var baseColorTextureDataObject =__glTF_new_data_object();
			var baseColorTex_index = pbr_baseColorTexture[?"index"];
			if (!is_undefined(baseColorTex_index)) {
				baseColorTextureDataObject.index = baseColorTex_index;
			}
			pbrMetRoughDataObject.baseColorTexture = baseColorTextureDataObject;
		}
			
		var pbr_metallicFactor = mat_pbrMetRough[?"metallicFactor"];
		if (!is_undefined(pbr_metallicFactor)) {
			pbrMetRoughDataObject.metallicFactor = pbr_metallicFactor;
		}
			
		var pbr_roughnessFactor = mat_pbrMetRough[?"roughnessFactor"];
		if (!is_undefined(pbr_roughnessFactor)) {
			pbrMetRoughDataObject.roughnessFactor = pbr_roughnessFactor;
		}
			
		var pbr_metallicRoughnessTexture = mat_pbrMetRough[?"metallicRoughnessTexture"];
		if (!is_undefined(pbr_metallicRoughnessTexture)) {
			var metRoughTexDataObject = __glTF_new_data_object();
			var metRoughTex_index = pbr_metallicRoughnessTexture[?"index"];
			if (!is_undefined(metRoughTex_index)) {
				metRoughTexDataObject.index = metRoughTex_index;
			}
			pbrMetRoughDataObject.metallicRoughnessTexture = metRoughTexDataObject;
		}
			
		materialDataObject.pbrMetallicRoughness = pbrMetRoughDataObject;
	}
	#endregion
		
	#region Normal Texture
	var mat_normTex = _material[?"normalTexture"];
	if (!is_undefined(mat_normTex)) {
		var normTexDataObject = __glTF_new_data_object();
			
		var norm_index = mat_normTex[?"index"];
		if (!is_undefined(norm_index)) {
			normTexDataObject.index = norm_index;
		}
			
		var norm_texCoord = mat_normTex[?"texCoord"];
		if (!is_undefined(norm_texCoord)) {
			normTexDataObject.texCoord = norm_texCoord;
		}
			
		var norm_scale = mat_normTex[?"scale"];
		if (!is_undefined(norm_scale)) {
			normTexDataObject.scale = norm_scale;
		}
			
		materialDataObject.normalTexture = normTexDataObject;
	}
	#endregion
		
	#region Occlusion Texture	
	var mat_occlTex = _material[?"occlusionTexture"];
	if (!is_undefined(mat_occlTex)) {
		var occlTexDataObject = __glTF_new_data_object();
			
		var occl_index = mat_occlTex[?"index"];
		if (!is_undefined(occl_index)) {
			occlTexDataObject.index = occl_index;
		}
			
		var occl_texCoord = mat_occlTex[?"texCoord"];
		if (!is_undefined(occl_texCoord)) {
			occlTexDataObject.texCoord = occl_texCoord;
		}
			
		var occl_strength = mat_occlTex[?"strength"];
		if (!is_undefined(occl_strength)) {
			occlTexDataObject.strength = occl_strength;
		}
			
		materialDataObject.occlusionTexture = occlTexDataObject;
	}
	#endregion
		
	#region Emissive Texture
	var mat_emisTex = _material[?"emissiveTexture"];
	if (!is_undefined(mat_emisTex)) {
		var emisTexDataObject = __glTF_new_data_object();
		var emisTex_index = mat_emisTex[?"index"];
		if (!is_undefined(emisTex_index)) {
			emisTexDataObject.index = emisTex_index;
		}
		materialDataObject.emissiveTexture = emisTexDataObject;
	}
	#endregion
		
	#region Emissive Factor
	var mat_emisFac = _material[?"emissiveFactor"];
	if (!is_undefined(mat_emisFac)) {
		materialDataObject.emissiveFactor = [];
		for (var j = 0; j < 3; ++j) {
			materialDataObject.emissiveFactor[j] = mat_emisFac[|j];
		}
	}
	#endregion
		
	var mat_alphaMode =_material[?"alphaMode"];
	if (!is_undefined(mat_alphaMode)) {
		materialDataObject.alphaMode = mat_alphaMode;
	}
		
	var mat_alphaCutoff = _material[?"alphaCutoff"];
	if (!is_undefined(mat_alphaCutoff)) {
		materialDataObject.alphaCutoff = mat_alphaCutoff;
	}
		
	var mat_doubleSided = _material[?"doubleSided"];
	if (!is_undefined(mat_doubleSided)) {
		materialDataObject.doubleSided = mat_doubleSided;
	}
	
	materials[i] = materialDataObject;
}

return materials;