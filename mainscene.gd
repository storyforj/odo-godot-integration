extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	if Input.is_key_pressed(KEY_R) and Input.is_key_pressed(KEY_SHIFT):
		JavaScript.eval('window.odo.trigger(window.ODO.Triggers.finish);', true)
		
	var hasRestarted = JavaScript.eval('window.ODORestartEventTriggered', true)
	if hasRestarted:
		JavaScript.eval('window.ODORestartEventTriggered = false;', true)
		get_tree().reload_current_scene()
