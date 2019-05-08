/// @func __glTF_gltf_asset_exists
/// @args id
var gltf_asset = argument0;

if (is_array(gltf_asset)) {
	var asset = gltf_asset[?"asset"];
	if (!is_undefined(asset)) {
		var asset_version = asset[?"version"];
		if (!is_undefined(asset_version)) return asset_version == 2;
	}
}

return false;