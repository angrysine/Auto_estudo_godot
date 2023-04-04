extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var total_rotated =  0 
var x_start = 300

func _rotator(x,y,z,r,body):
	
	if x >200 or y:
		
		var size = z/100
		r = 2*r*PI*100/10000
		body.position = Vector2(x,y)
		self.scale = Vector2(z/750+0.2,z/750+0.2)
		
		self.get_parent().get_parent().rotate(r-total_rotated)
		total_rotated += r-total_rotated
		if total_rotated >= 360:
			self.get_parent().get_parent().rotation -= 360
			total_rotated -= 360
		if total_rotated <= -360:
			self.get_parent().get_parent().rotation += 360
			total_rotated += 360
		
		
		print(self.get_parent().get_parent().rotation)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_parent().position.x = 300
	
	
	



func _process(_delta):
	var body = self.get_parent()

	var root =body.get_parent().get_parent().get_parent().get_children()
	
	var y = -root[0].value +150
	var x = root[1].value +x_start
	var z =root[2].value
	var r = root[3].value
	var button_move_to = root[4].pressed
	if button_move_to:
		_rotator(x,y,z,r,body)


