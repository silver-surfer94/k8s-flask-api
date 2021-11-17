from datetime import datetime

from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/', methods=['GET'])
def get_time():
    timestamp = int(datetime.now().timestamp())
    response = {'message': 'Automate all the things!', 'timestamp': timestamp}

    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8080)
