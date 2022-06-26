import requests

headers = {
    'X-My-Secret': 'SECRET',
}

response = requests.get('http://78.138.31.48:8080', headers=headers)
# print(response.text)
