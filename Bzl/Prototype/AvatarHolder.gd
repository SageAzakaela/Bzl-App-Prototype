extends PanelContainer


var avatar_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0.5, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.25, 0.25, 0.25), Color(0.6, 0.4, 0.2)]
var avatar_eye_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.3, 0, 0.5), Color(1, 0, 1), Color(0, 0, 0), Color(0.2, 0.2, 0.2), Color(0.6, 0.3, 0.1)]
var avatar_wing_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]
var avatar_stripe_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]

onready var avatar_eye_types := [$Eyes/Eyes, $Eyes/Eyes2, $Eyes/Eyes3, $Eyes/Eyes4, $Eyes/Eyes5]
onready var avatar_stripe_types := [$Stripes/Stripes1, $Stripes/Stripes2, $Stripes/Stripes3, $Stripes/Stripes4, $Stripes/Stripes5, $Stripes/Stripes6]
onready var avatar_antennar_types := [$Antannae/Antannae1, $Antannae/Antannae2, $Antannae/Antannae3, $Antannae/Antannae4, $Antannae/Antannae5, $Antannae/Antannae6]
onready var avatar_stinger_types := [$Stinger/Stinger1, $Stinger/Stinger2, $Stinger/Stinger3, $Stinger/Stinger4]


func _ready():
	var error
	error = CurrentLogIn.connect("avatar_color_changed", self, "on_avatar_color_changed")
	error = CurrentLogIn.connect("avatar_eyes_changed", self, "on_avatar_eyes_changed")
	error = CurrentLogIn.connect("avatar_eye_color_changed", self, "on_avatar_color_changed")
	error = CurrentLogIn.connect("avatar_wing_color_changed", self, "on_avatar_wing_color_changed")
	error = CurrentLogIn.connect("avatar_stripe_changed", self, "on_avatar_stripe_changed")
	error = CurrentLogIn.connect("avatar_stripe_color_changed", self, "on_avatar_stripe_color_changed")
	error = CurrentLogIn.connect("avatar_antennae_changed", self, "on_avatar_antennae_changed")
	error = CurrentLogIn.connect("avatar_stinger_changed", self, "on_avatar_stinger_changed")
	
	if error != OK:
		push_warning("One or more 'avatar changed' signals could not connect.")


func on_avatar_color_changed():
	change_color(CurrentLogIn.avatar_color, avatar_colors, $Base)


func on_avatar_eyes_changed():
	change_type(CurrentLogIn.avatar_eyes, avatar_eye_types)


func on_avatar_eye_color_changed():
	change_color(CurrentLogIn.avatar_eye_color, avatar_eye_colors, $Eyes)
	
	
func on_avatar_wing_color_changed():
	change_color(CurrentLogIn.avatar_wing_color, avatar_wing_colors, $Wings)
	

func on_avatar_stripe_changed():
	change_type(CurrentLogIn.avatar_stripe, avatar_stripe_types)
	
	
func on_avatar_stripe_color_changed():
	change_color(CurrentLogIn.avatar_stripe_color, avatar_stripe_colors, $Stripes)
	

func on_avatar_antennae_changed():
	change_type(CurrentLogIn.avatar_antennae, avatar_antennar_types)


func on_avatar_stinger_changed():
	change_type(CurrentLogIn.avatar_stinger, avatar_stinger_types)


# Usage example -> change_color(CurrentLogIn.avatar_stripe_color, avatar_stripe_colors, $Stripes)
func change_color(index, color_references, node):
	if index >= 0 and index < color_references.size():
		node.modulate = color_references[index]


# Usage example -> change_type(CurrentLogIn.avatar_stinger, avatar_stinger_types)
func change_type(index, type_references):
	if index >= 0 and index < type_references.size():
		for i in range(0, type_references.size()-1):
			type_references[i].visible = true if index == i else false
