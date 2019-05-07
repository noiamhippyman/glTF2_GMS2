/// @func glTF_load
/// @args filename
var filename = argument0;

if (!file_exists(filename)) {
	show_error(filename + " doesn't exist",true);
	// return ERROR_FILE_NOT_FOUND
}

var jsonString = __glTF_get_json_string(filename);
return json_decode(jsonString);