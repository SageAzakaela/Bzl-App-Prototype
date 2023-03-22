extends Node


func fetch(keywords: Array[String]) -> Array[BuzzData]:
	var query := FirestoreQuery.new()
	
	query.from("buzzes")
	query.where("keywords", FirestoreQuery.OPERATOR.ARRAY_CONTAINS_ANY, keywords)
	#query.order_by("timestamp", FirestoreQuery.DIRECTION.DESCENDING)
	
	var query_task : FirestoreTask = Firebase.Firestore.query(query)
	
	var result: FirestoreTask = await query_task.task_finished
	
	var buzzes: Array[BuzzData]
	
	if result.data is String:
		return buzzes
	
	for i in range(0, result.data.size()):
		var new_buzz := BuzzData.new()
		new_buzz.set_with_dict(result.data[i]["doc_fields"])
		buzzes.append(new_buzz)
	
	return buzzes


func get_buzz(bid: String) -> BuzzData:
	var document_task : FirestoreTask = DBManager.buzzes_collection.get_doc(bid)
	var document : FirestoreDocument = await document_task.get_document
	
	var buzz_data := FirestoreDocument.fields2dict(document.document)
	
	var buzz := BuzzData.new()
	buzz.set_with_dict(buzz_data)
	
	return buzz


func create_buzz(title: String, content: String, keywords: Array[String]):
	var buzz := BuzzData.new()
	
	buzz.author = UserManager.get_active_user()
	buzz.title = title
	buzz.content = content
	buzz.keywords = keywords
	buzz.timestamp = Time.get_unix_time_from_system()
	buzz.bid = calculate_hash(buzz.content, buzz.timestamp)
	
	var add_task : FirestoreTask = DBManager.buzzes_collection.add(buzz.bid, buzz.get_as_dict())
	var document : FirestoreTask = await add_task.task_finished
	
	
# -----< helpers >----- #
func calculate_hash(content: String, timestamp: float):
	return "bid" + str(hash(content + str(timestamp)))
