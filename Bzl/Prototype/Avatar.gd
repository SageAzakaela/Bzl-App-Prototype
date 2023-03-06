extends PanelContainer


var avatar_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0.5, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.25, 0.25, 0.25), Color(0.6, 0.4, 0.2)]
var avatar_eye_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.3, 0, 0.5), Color(1, 0, 1), Color(0, 0, 0), Color(0.2, 0.2, 0.2), Color(0.6, 0.3, 0.1)]
var avatar_wing_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]
var avatar_stripe_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]

onready var avatar_eye_types := [$Eyes/Eyes, $Eyes/Eyes2, $Eyes/Eyes3, $Eyes/Eyes4, $Eyes/Eyes5]
onready var avatar_stripe_types := [$Stripes/Stripes1, $Stripes/Stripes2, $Stripes/Stripes3, $Stripes/Stripes4, $Stripes/Stripes5, $Stripes/Stripes6]
onready var avatar_antennar_types := [$Antannae/Antannae1, $Antannae/Antannae2, $Antannae/Antannae3, $Antannae/Antannae4, $Antannae/Antannae5, $Antannae/Antannae6]
onready var avatar_stinger_types := [$Stinger/Stinger1, $Stinger/Stinger2, $Stinger/Stinger3, $Stinger/Stinger4]
onready var BUZZ = get_node("../../../../../..")

func _ready():
	set_avatar_elements()
	

func set_avatar_elements():
	var avatar_color_index = BUZZ.avatar_color
	var avatar_eye_index = BUZZ.avatar_eyes
	var avatar_eye_color_index = BUZZ.avatar_eye_color
	var avatar_wing_color_index = BUZZ.avatar_wing_color
	var avatar_stripe_index = BUZZ.avatar_stripe
	var avatar_stripe_color_index = BUZZ.avatar_stripe_color
	var avatar_antennae_index = BUZZ.avatar_antennae
	var avatar_stinger_index = BUZZ.avatar_stinger

	
	change_color(avatar_color_index, avatar_colors, $Base)
	change_type(avatar_eye_index, avatar_eye_types)
	change_color(avatar_eye_color_index, avatar_eye_colors, $Eyes)
	change_color(avatar_wing_color_index, avatar_wing_colors, $Wings)
	change_type(avatar_stripe_index, avatar_stripe_types)
	change_color(avatar_stripe_color_index, avatar_stripe_colors, $Stripes)
	change_type(avatar_antennae_index, avatar_antennar_types)
	change_type(avatar_stinger_index, avatar_stinger_types)



# Usage example -> change_color(CurrentLogIn.avatar_stripe_color, avatar_stripe_colors, $Stripes)
func change_color(index, color_references, node):
	if index >= 0 and index < color_references.size():
		node.modulate = color_references[index]


# Usage example -> change_type(CurrentLogIn.avatar_stinger, avatar_stinger_types)
func change_type(index, type_references):
	if index >= 0 and index < type_references.size():
		for i in range(0, type_references.size()):
			type_references[i].visible = true if index == i else false
