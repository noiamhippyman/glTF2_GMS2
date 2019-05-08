/// @func __glTF_json_parse_cameras
/// @args camerasJsonData
var camerasJsonData = argument0;
var cameracount = ds_list_size(camerasJsonData);
var cameras = [];

for (var i = 0; i < cameracount; ++i) {
	var camera = camerasJsonData[|i];
	var camDataObject = __glTF_new_data_object();
	
	var cam_orthographic = camera[?"orthographic"];
	if (!is_undefined(cam_orthographic)) {
		var orthoDataObject = __glTF_new_data_object();
		
		var ortho_xmag = cam_orthographic[?"xmag"];
		if (!is_undefined(ortho_xmag)) {
			orthoDataObject.xmag = ortho_xmag;
		}
		
		var ortho_ymag = cam_orthographic[?"ymag"];
		if (!is_undefined(ortho_ymag)) {
			orthoDataObject.ymag = ortho_ymag;
		}
		
		var ortho_zfar = cam_orthographic[?"zfar"];
		if (!is_undefined(ortho_zfar)) {
			orthoDataObject.zfar = ortho_zfar;
		}
		
		var ortho_znear = cam_orthographic[?"znear"];
		if (!is_undefined(ortho_znear)) {
			orthoDataObject.znear = ortho_znear;
		}
		
		camDataObject.orthographic = orthoDataObject;
	}
	
	var cam_perspective = camera[?"perspective"];
	if (!is_undefined(cam_perspective)) {
		var persDataObject = __glTF_new_data_object();
		
		var pers_aspect = cam_perspective[?"aspectRatio"];
		if (!is_undefined(pers_aspect)) {
			persDataObject.aspectRatio = pers_aspect;
		}
		
		var pers_yfov = cam_perspective[?"yfov"];
		if (!is_undefined(pers_yfov)) {
			persDataObject.yfov = pers_yfov;
		}
		
		var pers_zfar = cam_perspective[?"zfar"];
		if (!is_undefined(pers_zfar)) {
			persDataObject.zfar = pers_zfar;
		}
		
		var pers_znear = cam_perspective[?"znear"];
		if (!is_undefined(pers_znear)) {
			persDataObject.znear = pers_znear;
		}
		
		camDataObject.perspective = persDataObject;
	}
	
	var cam_type = camera[?"type"];
	if (!is_undefined(cam_type)) {
		camDataObject.type = cam_type;
	}
	
	var cam_name = camera[?"name"];
	if (!is_undefined(cam_name)) {
		camDataObject.name = cam_name;
	}
	
	cameras[i] = camDataObject;
}

return cameras;