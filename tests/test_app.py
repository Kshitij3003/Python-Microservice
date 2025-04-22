import unittest
from fastapi.testclient import TestClient
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from app.main import app

class TestMain(unittest.TestCase):
    def setUp(self):
        self.client = TestClient(app)

    def test_health_check(self):
        response = self.client.get("/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"status": "OK"})

    def test_say_hello(self):
        name = "John"
        response = self.client.get(f"/hello/{name}")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"message": f"Hello, {name}!"})

if __name__ == "__main__":
    unittest.main()