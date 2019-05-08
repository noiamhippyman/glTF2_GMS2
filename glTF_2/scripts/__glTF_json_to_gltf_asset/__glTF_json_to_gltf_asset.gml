/// @func __glTF_json_to_gltf_asset
/// @args jsonData
/// @desc Parses and packages everything into DataObjects for easier traversal with GML. Sure hope it's helpful LOL... *lonelyface*
var jsonData = argument0;

// Check asset metadata to validate file
var asset = jsonData[?"asset"];
if (is_undefined(asset) || asset[?"version"] != 2) {
	show_error("Not a valid gltf asset",true);
}

var gltf = __glTF_new_data_object();

var extensionsUsed = jsonData[?"extensionsUsed"];
if (!is_undefined(extensionsUsed)) gltf.extensionsUsed = __glTF_json_parse_extensionsUsed(extensionsUsed);

var extensionsRequired = jsonData[?"extensionsRequired"];
if (!is_undefined(extensionsRequired)) gltf.extensionsRequired =__glTF_json_parse_extensionsRequired(extensionsRequired);

var accessors = jsonData[?"accessors"];
if (!is_undefined(accessors)) gltf.accessors = __glTF_json_parse_accessors(accessors);

var animations = jsonData[?"animations"];
if (!is_undefined(animations)) gltf.animations = __glTF_json_parse_animations(animations);

var buffers = jsonData[?"buffers"];
if (!is_undefined(buffers)) gltf.buffers = __glTF_json_parse_buffers(buffers);

var bufferViews = jsonData[?"bufferViews"];
if (!is_undefined(bufferViews)) gltf.bufferViews = __glTF_json_parse_bufferViews(bufferViews);

var cameras = jsonData[?"cameras"];
if (!is_undefined(cameras)) gltf.cameras = __glTF_json_parse_cameras(cameras);

var images = jsonData[?"images"];
if (!is_undefined(images)) gltf.images = __glTF_json_parse_images(images);

var materials = jsonData[?"materials"];
if (!is_undefined(materials)) gltf.materials = __glTF_json_parse_materials(materials);

var meshes = jsonData[?"meshes"];
if (!is_undefined(meshes)) gltf.meshes = __glTF_json_parse_meshes(meshes);

var nodes = jsonData[?"nodes"];
if (!is_undefined(nodes)) gltf.nodes = __glTF_json_parse_nodes(nodes);

var samplers = jsonData[?"samplers"];
if (!is_undefined(samplers)) gltf.samplers = __glTF_json_parse_samplers(samplers);

var scene = jsonData[?"scene"];
if (!is_undefined(scene)) gltf.scene = scene;

var scenes = jsonData[?"scenes"];
if (!is_undefined(scenes)) gltf.scenes = __glTF_json_parse_scenes(scenes);

var skins = jsonData[?"skins"];
if (!is_undefined(skins)) gltf.skins = __glTF_json_parse_skins(skins);

var textures = jsonData[?"textures"];
if (!is_undefined(textures)) gltf.textures = __glTF_json_parse_textures(textures);

var extensions = jsonData[?"extensions"];
if (!is_undefined(extensions)) gltf.extensions = __glTF_json_parse_extensions(extensions);

var extras = jsonData[?"extras"];
if (!is_undefined(extras)) gltf.extras = __glTF_json_parse_extras(extras);

return gltf;