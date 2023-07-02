import requests

cookies = {
    'fht_dwn_CT23DxaALp': '1',
}

headers = {
    # 'authority': 'krakenfiles.com',
    # 'accept': '*/*',
    # 'accept-language': 'en-US,en;q=0.9',
    # 'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
    'hash': 'CT23DxaALp',
}

data = {
    'token': 'MjU1ZWY5ODE2OTJmODMyZOs8SQDjBOa-QIzMHNh3wl0',
}

response = requests.post('https://krakenfiles.com/download/CT23DxaALp', headers=headers, data=data).json()

print(response)