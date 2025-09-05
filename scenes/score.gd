extends Label

var score = 0

func _on_body_entered():
	score += 100
	text = "Score: %s" % score
