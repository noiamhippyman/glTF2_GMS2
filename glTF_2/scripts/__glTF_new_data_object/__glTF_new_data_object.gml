/// @func __glTF_new_data_object
if (layer_get_id("DataObjects") == -1) {
	layer_create(0,"DataObjects");
}


return instance_create_layer(0,0,"DataObjects",DataObject);