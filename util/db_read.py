import sys, json
from google.cloud import firestore

db = firestore.Client()
collection = sys.argv[1]
id = sys.argv[2]

collection_ref = db.collection(collection)
docs = collection_ref.stream()

for doc in docs:
    if doc.id == id:
        print(json.dumps(doc.to_dict(), indent=4))
        break