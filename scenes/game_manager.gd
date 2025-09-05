extends Node
@onready var score_label = %Score

var score = 0
func add_point():
	score += 100
	score_label.text = "Score: %d" % score
	
