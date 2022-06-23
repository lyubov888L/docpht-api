import requests

headers = {
    'X-My-Secret': 'SECRET',
}

response = requests.get('http://localhost:8080', headers=headers)