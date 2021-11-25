import requests

ams_url = "https://ams.zpi.com"
headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
}
crt = 'proxy/zpi.com.crt'

r = requests.post(
    ams_url + "/api/manager/signin", headers=headers, json={'username': 'admin', 'password': 'admin'}, verify=crt)

token = r.text
print(r.text)

auth_headers = {
    'Authorization': f'Bearer {token}',
    'Content-type': 'application/json',
    'Accept': 'application/json'
}

r = requests.post(ams_url + "/api/clients", headers=auth_headers,
                  json={'id': '2', 'availableRedirectUris': ['https://demo.zpi.com/']}, verify=crt)

print(r, r.text)

r = requests.post(ams_url + "/api/users", headers=headers,
                  json={'username': 'user@zpi.com', 'email': 'user@zpi.com'}, verify=crt)

print(r, r.text)
