/// @func __glTF_gltf_asset_create
/// @args json,[glb]

var gltf_asset = [];

gltf_asset[enGLTF_Asset.JSON] = argument[0];
gltf_asset[enGLTF_Asset.GLB] = argument_count > 1 ? argument[1] : noone;

return gltf_asset;