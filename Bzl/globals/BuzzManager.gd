extends Node


func fetch(keywords: Array[String]) -> Array[BuzzData]:
	var buzzes: Array[BuzzData]
	
	var task: FirestoreTask = Firebase.Firestore.list("buzzes", 50)
	var buzz_docs: Array = await task.listed_documents
	
	for i in range(0, buzz_docs.size()):
		var tmp: BuzzData = await get_buzz(buzz_docs[i]["doc_name"])
		
		for j in range(0, keywords.size()):
			if keywords[j] == "":
				continue
				
			if tmp.keywords.has(keywords[j]):
				buzzes.append(tmp)
				break
	
	return buzzes


func get_buzz(bid: String) -> BuzzData:
	var document_task : FirestoreTask = DBManager.buzzes_collection.get_doc(bid)
	var document : FirestoreDocument = await document_task.get_document
	
	var buzz_data := FirestoreDocument.fields2dict(document.document)
	
	var buzz := BuzzData.new()
	buzz.set_with_dict(buzz_data)
	
	return buzz


func create_buzz(buzz: BuzzData):
	buzz.bid = calculate_hash(buzz.content, buzz.timestamp)
	
	var add_task : FirestoreTask = DBManager.buzzes_collection.add(buzz.bid, buzz.get_as_dict())
	var document : FirestoreTask = await add_task.task_finished
	
	
# -----< helpers >----- #
func calculate_hash(content: String, timestamp: int):
	return "bid" + str(hash(content + str(timestamp)))
