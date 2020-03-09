extends Node2D

var hasChangedToFirstScene = false

# Called when the node enters the scene tree for the first time.
func _ready():
	JavaScript.eval('window.odo.trigger(window.ODO.Triggers.ready);', true)

func _process(_delta):
	var hasStarted = JavaScript.eval('window.ODOStartEventTriggered', true)
	if hasStarted and not hasChangedToFirstScene:
		hasChangedToFirstScene = true
		assert(get_tree().change_scene('dungeon.tscn') == OK)
