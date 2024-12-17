extends Node2D

@onready var night_filter: CanvasModulate = $"../../NightFilter"

var night : bool = false :
	set(value) :
		night = value
		if night == true :
			%DayOrNight.text = "Night"
			night_filter.color = Color(0.2, 0.3, 0.6)
		else :
			%DayOrNight.text = "Day"
			night_filter.color = Color(1, 1, 1)

var second : int :
	set(value) :
		second = value
		if second == 5 :
			night = !night
		if second == 10 :
			second = 0
			numberOfDay += 1
			night = !night
		%Hour.text = str(second).lpad(2, "0")

var numberOfDay : int = 1 :
	set(value) :
		numberOfDay = value
		%NumberOfDays.text = str(numberOfDay)

func _on_timer_timeout() -> void:
	second += 1
