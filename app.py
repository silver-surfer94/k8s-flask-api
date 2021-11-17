import os
from datetime import datetime

from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/')
def hello_world():
    target = os.environ.get('TARGET', 'World')
    return 'Hello {}!\n'.format(target)


@app.route('/time/', methods=['GET'])
def get_time():
    timestamp = int(datetime.now().timestamp())
    response = {'message': 'Automate all the things!', 'timestamp': timestamp}

    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
