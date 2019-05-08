/// @func __glTF_gltf_asset_delete
/// @args id
var gltf_asset = argument0;

if (!__glTF_gltf_asset_exists(gltf_asset)) exit;

var json = gltf_asset[enGLTF_Asset.JSON];
ds_map_destroy(json);

var glb = gltf_asset[enGLTF_Asset.GLB];
if (buffer_exists(glb)) buffer_delete(glb);

