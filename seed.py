import requests

ams_url = "http://ams.zpi.com"
headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
}

r = requests.post(
    ams_url + "/api/manager/signin", headers=headers, json={'username': 'admin', 'password': 'admin'})

token = r.text
print(r.text)

auth_headers = {
    'Authorization': f'Bearer {token}',
    'Content-type': 'application/json',
    'Accept': 'application/json'
}

r = requests.post(ams_url + "/api/clients", headers=auth_headers,
                  json={'id': '2', 'availableRedirectUris': ['http://demo.zpi.com/']})

print(r, r.text)

r = requests.post(ams_url + "/api/users", headers=headers,
                  json={'username': 'user@zpi.com', 'email': 'user@zpi.com'})

print(r, r.text)
