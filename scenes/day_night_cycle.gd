extends Node2D

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
