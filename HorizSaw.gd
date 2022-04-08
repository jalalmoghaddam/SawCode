extends Node2D

onready var tween = $Tween
onready var timer = $Timer
onready var player = $AudioStreamPlayer2D

export var Xmove = -30

export (float) var startTime = 1
export (float) var moveTime = 1
export (float) var stopTime = 1

#0 = not started
#1 = forward
#2 = backward
#3 = stay
var moving = 0 

func _ready():
	timer.wait_time = startTime
	timer.start()
	moving = 1

func _on_Timer_timeout():
	if moving <3 :
		tween.interpolate_property(self,"position",
			self.position,self.position+Vector2(Xmove,0),moveTime)
		Xmove *= -1
		tween.start()
		timer.wait_time = moveTime
		timer.start()
		player.play()
	else :
		timer.wait_time = stopTime
		timer.start()
		
	#change movin situation to delay and viceversa
	if moving < 3 : 
		moving += 1
	else :
		moving = 1
