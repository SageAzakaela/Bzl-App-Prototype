extends Node


@onready var users_collection : FirestoreCollection = Firebase.Firestore.collection("users")
@onready var posts_collection : FirestoreCollection = Firebase.Firestore.collection("buzzes")



