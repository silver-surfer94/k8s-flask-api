
import requests


def test_get_time_check_content_type_equals_json():
    """
    Test response returned is JSON
    """
    response = requests.get("http://localhost:8080/")
    assert response.headers["Content-Type"] == "application/json"


def test_get_time_check_response_message():
    """
    Test response message is 'Automate all the things!'
    """
    response = requests.get("http://localhost:8080/")
    response_body = response.json()
    assert response_body["message"] == "Automate all the things!"


def test_get_time_check_response_timestamp():
    """
    Test response timestamp is integer
    """
    response = requests.get("http://localhost:8080/")
    response_body = response.json()
    assert type(response_body["timestamp"]) == int