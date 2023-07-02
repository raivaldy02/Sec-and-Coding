import re, os, json

data = {
    "SSH": "",
    "Payload": "",
    "Proxy": "",
    "SNI": "",
    "V2ray": "",
    "Exp": "",
    "IsLoginHwid": "",
    "LockHWID": "",
    "verApp": "",
    "LockProvider": "",
    "Url": "",
}

def get_v2ray_cfg(content: str) -> dict | str:
    v2ray_regex = r".inbounds.*(\s{1,}.*\n)?(\s{1,}.*\n)?(\s{1,}.*\n)?(\s{1,}.*)?(\n\s{1,}.*\n)?(\s{1,}.*\n)?(\s{1,}.*\n){1,}"
    v2ray_cfg = "{"
    matches = re.finditer(v2ray_regex, content)
    if matches != None:
        for i in matches:
            match = i.group(0)
            if v2ray_cfg == '':
                v2ray_cfg = match
            else:
                v2ray_cfg += match
                v2ray_cfg += "}"
        try: v2ray_cfg = json.loads(v2ray_cfg)
        except: v2ray_cfg = json.loads(v2ray_cfg + "\n}")
        return v2ray_cfg
    else:
        return None

def hc(file:str):
    ssh_field = re.compile(r'.*:?[0-9]{2,10}@.*',re.MULTILINE)
    expire_time = re.compile("[0-9]{4}-[0-9]{2}-[0-9]{1,2}\s[0-9]{2}:[0-9]{2}")
    sni_field = re.compile("(?:[\w-]+\.)*([\w-]{1,63})(?:\.(?:\w{3}|\w{2}))(?:$|\/)")
    proxy_field = re.compile("^(([a-z0-9]|[a-z0-9][a-z0-9\-]*[a-z0-9])\.)*([a-z0-9]|[a-z0-9][a-z0-9\-]*[a-z0-9]):[0-9]+?\s?\n")
    update_url = re.compile("https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)")
    match_payload = ["GET wss://","GET ws://","GET sni://","GET shi://","PUT /?","CONNECT / HTTP","ACL wss://","BCOPY wss://","BDELETE wss://","BMOVE wss://","BPROPFIND wss://","BPROPATCH wss://","CHECKIN wss://","COPY wss://","DELETE wss://","HEAD h2","HEAD shi","GET h2","GET wss://","HEAD wss://","LABEL wss://","LOCK wss://","MERGE wss://","MKCOL wss://","MOVE wss://","NOTIFY wss://","PATCH wss://","POLL wss://","PROPATCH wss://","PROPFIND wss://","GET wess","PUT wss://","REPORT wss://","SEARCH wss://","SUBSCRIBE wss://","TRACE wss://","UNCHECKOUT wss://","UNLOCK wss://","UNSUBSCRIBE wss://","UPDATE wss://","HEAD https://","PUT https","GET ssl","HEAD /","CONNECT [host_port]","BDELETE","CONNECT","GET","PUT","MOVE","BMOVE","HEAD","PUTA","POST","Host:","[crlf]","[lf]","[cr]",'\\r','\\n']
    
    lines = open(file, "r").readlines()
    content = open(file, "r").read()
     
    for i in lines:
        line = i.rstrip().removesuffix(",")
        exp_ = expire_time.findall(i)
        sni_ = sni_field.match(line)
        ssh_ = ssh_field.match(line)
        
        if ssh_ != None: data["SSH"] = ssh_[0]
        elif len(exp_) != 0: data["Exp"] = exp_[0]
        elif sni_ != None and data["SNI"] == "" and data["SNI"] != sni_[0]: data["SNI"] = sni_[0]

        elif any(x in line for x in match_payload) and not '"d":' in line:
            if data["Payload"] == "":
                data["Payload"] = line
            else:
                data["Payload"] += f"\n{line}"
        
        elif proxy_field.match(i): data["Proxy"] = line
        elif "IsLoginHwid" in i: data["IsLoginHwid"] = line.split(":")[1].removesuffix(",")
        elif "verApp" in i: data["verApp"] = line.split(":")[1]
        elif '"f"' in i: data["LockProvider"] = line.split(":")[1].replace('"', "").rstrip()
        elif '"b"' in i: data["LockHWID"] = line.split(":")[1].replace('"', "").rstrip()
        elif '"Url"' in i:
            split_ = line.split(":")
            data["url"] = f"{split_[1]}{split_[2]}".replace('"', "").rstrip()
        elif '"dns": {' in i or '"inbounds": [],' in i or '"SNI": {' in i:
            data["V2ray"] = get_v2ray_cfg(content)
        
    return data

def main():
    file =  "/sdcard/teste/decrypt.txt"
    logs = "/sdcard/teste/logs.txt"
    os.system(f"strings {file} > {logs}")
    os.system('cls||clear')
    data = hc(logs)
    print("")
    print(f"\n")
    for key in data:
        value = data[key]
        if value != '':

            print(f"➔ {key}: {value}")
            print(f"\n")
    
#    os.remove(logs)

if __name__ == "__main__":
    main()