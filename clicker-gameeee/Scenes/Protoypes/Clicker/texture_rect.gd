extends TextureRect

func _ready():
	set_opacity(0.7)
	
func set_opacity(value: float):
	modulate.a = clamp(value, 0.0, 1.0)
