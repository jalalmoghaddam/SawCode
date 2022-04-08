extends Node2D

onready var anim = $AnimationPlayer
onready var audio = $AudioStreamPlayer2D
#
func _ready():
	pass # Replace with function body.


func Act():
	anim.play("Stop")	
	$Area2D/CollisionShape2D.free()



