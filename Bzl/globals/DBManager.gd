extends Node


@onready var users_collection : FirestoreCollection = Firebase.Firestore.collection("users")
@onready var buzzes_collection : FirestoreCollection = Firebase.Firestore.collection("buzzes")
