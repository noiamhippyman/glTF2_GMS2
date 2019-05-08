/// @func __glTF_json_parse_extensionsUsed
/// @args extensionsUsedJsonData
var extensionsUsedJsonData = argument0;
var extensionsUsed = [];
var extcount = ds_list_size(extensionsUsedJsonData);

for (var i = 0; i < extcount; ++i) {
	extensionsUsed[i] = extensionsUsedJsonData[|i];
}

return extensionsUsed;