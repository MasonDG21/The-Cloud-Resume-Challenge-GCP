import sys
import logging
from flask import Flask, jsonify
from flask_cors import CORS
from google.cloud import datastore

# Configure logging
logging.basicConfig(level=logging.INFO)

app = Flask(__name__)
CORS(app)
# CORS(app, resources={r"/api/*": {"origins": "https://masondg-portfolio.com"}})

# Log startup information
logging.info(f"Python version: {sys.version}")

# Initialize Datastore client
datastore_client = datastore.Client()

@app.route('/')
def hello():
    return "Hello, World!"

@app.route('/api/visitcount', methods=['GET', 'POST'])
def visit_count():
    logging.info("Received request to /api/visitcount")
    kind = 'VisitorCount'
    name = 'VisitorCount'
    key = datastore_client.key(kind, name)

    try:
        with datastore_client.transaction():
            entity = datastore_client.get(key)
            if not entity:
                entity = datastore.Entity(key=key)
                entity['count'] = 0

            entity['count'] += 1
            datastore_client.put(entity)

        new_count = entity['count']
        logging.info(f"Successfully updated count to {new_count}")
        return jsonify({'count': new_count}), 200
    except Exception as e:
        logging.error(f"Error updating visit count: {str(e)}")
        return jsonify({'error': str(e)}), 500

if __name__ == "__main__":
    logging.info("Starting application")
    app.run(host='0.0.0.0', port=8080)