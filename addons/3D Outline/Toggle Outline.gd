extends Spatial


# Just copy the "_toggle_outline" function and it should work in MOST cases (for more read the NOTICE below)

func _toggle_outline(value):
	var mesh_instance = $MeshInstance
	
	# loop trhow all materials attached to the MeshInstance and if they have a next_pass applied, toogle the shader_parameter "enable" = value
	for i in range(mesh_instance.get_surface_material_count()):
		if mesh_instance.get_surface_material(i).next_pass != null: # check if a next_pass is attached
			mesh_instance.get_surface_material(i).next_pass.set_shader_param("enable", value) # apply new value for "enable"
	
	# ! NOTICE ! This moethod isn't free of Errors. It assumes that all next_passes are the Outline Shader.
	# If you got a next_pass attached to a material which is used by the MeshInstance your are tying to toggle
	# the outline on by using this method,
	# it should throw you an error, due to the fact that the next_pass doesn't have the shader_parameter "enable"
#
# This might be a rare case but shouldn't be underestimated.
