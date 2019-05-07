/// @func __glTF_get_vertex_format
if (!variable_global_exists("__glTF_vertex_format")) {
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	global.__glTF_vertex_format = vertex_format_end();
}

return global.__glTF_vertex_format;