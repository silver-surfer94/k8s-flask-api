from flask import Flask, jsonify, request
from datetime import datetime

app = Flask(__name__)


@app.route('/time/', methods=['GET'])
def get_time():
    timestamp = int(datetime.now().timestamp())
    response = {'message': 'Automate all the things!', 'timestamp': timestamp}

    return jsonify(response)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9007)
