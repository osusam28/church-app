import os, json

from flask import Flask
from google.cloud import firestore

app = Flask(__name__)
db = firestore.Client()


@app.route("/getFamilyEntity/all")
def get_family_entities():
    print('receiving request ...')

    collection_ref = db.collection('family_entities')
    docs = collection_ref.stream()

    out = []

    for doc in docs:
        doc_dict = doc.to_dict()
        doc_dict['id'] = doc.id
        print(f'reading doc [{doc.id}]')
        out.append(doc_dict)

    print(f'returning [{out}]')
    
    return json.dumps(out)

@app.route("/getFamilyEntity")
def get_family_entity():
    print('receiving request ...')

    raise NotImplementedError()


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))