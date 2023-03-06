extends Node


var logged_in_username = ""
var logged_in_pronouns = ""
var logged_in_bio = ""

#user points and inventory

var logged_in_nectar = 0
var logged_in_inventory = []

#avatar stuff
signal avatar_color_changed
signal avatar_eyes_changed
signal avatar_eye_color_changed
signal avatar_wing_color_changed
signal avatar_stripe_changed
signal avatar_stripe_color_changed
signal avatar_antennae_changed
signal avatar_stinger_changed

var avatar_color = 0 : set = set_avatar_color
var avatar_eyes = 0 : set = set_avatar_eyes
var avatar_eye_color = 0 : set = set_avatar_eye_color
var avatar_wing_color = 0 : set = set_avatar_wing_color
var avatar_stripe = 0 : set = set_avatar_stripe
var avatar_stripe_color = 0 : set = set_avatar_stripe_color
var avatar_antennae = 0 : set = set_avatar_antennae
var avatar_stinger = 0 : set = set_avatar_stinger

func set_avatar_color(value):
	avatar_color = value
	emit_signal("avatar_color_changed")

func set_avatar_eyes(value):
	avatar_eyes = value
	emit_signal("avatar_eyes_changed")
	
func set_avatar_eye_color(value):
	avatar_eye_color = value
	emit_signal("avatar_eye_color_changed")
	
func set_avatar_wing_color(value):
	avatar_wing_color = value
	emit_signal("avatar_wing_color_changed")
	
func set_avatar_stripe(value):
	avatar_stripe = value
	emit_signal("avatar_stripe_changed")
	
func set_avatar_stripe_color(value):
	avatar_stripe_color = value
	emit_signal("avatar_stripe_color_changed")

func set_avatar_antennae(value):
	avatar_antennae = value
	emit_signal("avatar_antennae_changed")
	
func set_avatar_stinger(value):
	avatar_stinger = value
	emit_signal("avatar_stinger_changed")
