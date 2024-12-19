extends Node2D

@onready var night_filter : CanvasModulate = %NightFilter

const DAY_COLOR = Color(1, 1, 1)
const NIGHT_COLOR = Color(0.2, 0.3, 0.6)

func _ready() -> void: #start the day at 8am
	night_filter.color = DAY_COLOR.lerp(NIGHT_COLOR, 1 - ( 8 / 12.0 ) )

var night : bool = false :
	set(value) :
		night = value
		if night == true :
			%DayOrNight.text = "Night"
		else :
			%DayOrNight.text = "Day"

var second : int :
	set(value) :
		second = value
		if second >= 1 :
			hour += 1
			second = 0

var hour : int = 8 :
	set(value) :
		hour = value
		match hour :
			8 :
				numberOfDay += 1
				night = !night
			20 :
				night = !night
			24 :
				hour = 0
		applyNightFilter(hour)
		%Hour.text = str(hour).lpad(2, "0")

func applyNightFilter(time) :
	var light : int
	var mod = time % 25
	if mod == 0:
		light = 1
	elif mod <= 12:
		light = mod
	else :
		light = 24 - mod
	night_filter.color = DAY_COLOR.lerp(NIGHT_COLOR, 1 - ( light / 12.0 ) )


var numberOfDay : int = 1 :
	set(value) :
		numberOfDay = value
		%NumberOfDays.text = str(numberOfDay)

func _on_timer_timeout() -> void :
	second += 1
