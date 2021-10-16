import sys, uuid, json
from pathlib import Path
from google.cloud import firestore

db = firestore.Client()
collection = sys.argv[1]
doc_id = str(uuid.uuid4())
data = json.loads(Path(sys.argv[2]).resolve().read_text())


db.collection(collection).document(doc_id).set(data)