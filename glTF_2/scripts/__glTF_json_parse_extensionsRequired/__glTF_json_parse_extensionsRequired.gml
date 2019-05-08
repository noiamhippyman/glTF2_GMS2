/// @func __glTF_json_parse_extensionsRequired
/// @args extensionsRequiredJsonData
var extensionsRequiredJsonData = argument0;
var extensionsRequired = [];
var extcount = ds_list_size(extensionsRequiredJsonData);

for (var i = 0; i < extcount; ++i) {
	extensionsRequired[i] = extensionsRequiredJsonData[|i];
}

return extensionsRequired;