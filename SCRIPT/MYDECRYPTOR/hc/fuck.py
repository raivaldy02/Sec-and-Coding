import re
import os
from shutil import which

def indices(lst) : 
    return [index for index, value in enumerate(lst) if "true" in value or "false" in value][-1] + 1

os.system("lua sc_old.lua")
with open("/sdcard/decryptOutput.txt", mode = "r") as f : 
    content = str(f.read())
    print(content)
    f.close()
content = content.split("\n")

regex_config = {
    "Payload" : { 
        "regex" : r"((GET|HEAD|POST|PUT|DELETE|CONNECT)[\w\/\:\ \[\]\.\-]+\])",
        "range" : range(0, 1)
    },
    "Proxy" : { 
        "regex" : r"((?:[\w-]+\.)*[\w-]{1,63}(?:\.(?:\w{3}|\w{2})):(?:\d{2,}))",
        "range" : range(1, 2)
    },
    "ExpiryTime" : { 
        "regex" : r"(lifeTime|\d{4}-\d{2}-\d{2} \d{2}:\d{2})",
        "range" : range(3, 6)
    },
    "AkunSSH" : { 
        "regex" : r"([\w\-\.]+:[\d]+@[\w\-\.]+:[\w]+)",
        "range" : range(6, 8)
    },
    "SNI" : { 
        "regex" : r"([\w\-\.]+\.\w+)",
        "range" : range(10, 13)
    },
    "PSIPHON" : {
        "regex" : r"(\x5b\x22.*)",
        "range" : range(24, 26)
    },
    "V2Ray" : { 
        "regex" : r"(inbounds.*\})",
        "range" : range(25, 27)
    },
    "Name Sever" : { 
        "regex" : r"([\w\-\.]+\.\w{1,3})",
        "range" : range(27, 30)
    },
    "Public Key" : { 
        "regex" : r"\d+:([a-f0-9]{32,64})",
        "range" : range(29, 31)
    },
    "DNS Host" : { 
        "regex" : r"([\w\-\.]+\.\w{1,3})",
        "range" : range(30, 32)
    },
}

hasil = {
    "Payload" : None,
    "Proxy" : None,
    "ExpiryTime" : None,
    "AkunSSH" : None,
    "SNI" : None,
    "PSIPHON" : None,
    "V2Ray" : None,
    "Name Sever" : None,
    "Public Key" : None,
    "DNS Host" : None
}


checkBegin = re.compile(f"""{regex_config["Payload"]["regex"]}|\d:kosong|\d:temp""")
if (not re.search(checkBegin, content[0]) ) : 
    content = content[1:-1]

msg = ""
for index, eachConfig in enumerate(content) : 

    for regex_key in regex_config : 

        if re.search(regex_config[regex_key]["regex"], eachConfig) and not hasil[regex_key] and index in regex_config[regex_key]["range"]: 

            hasil[regex_key] = re.search(regex_config[regex_key]["regex"], eachConfig).group(1)
            print(f"""</> {regex_key}: {hasil[regex_key]}\n""")
            msg += f"""</> {regex_key}: {hasil[regex_key]}\n"""
            break
    

if 'com.termux' in os.getenv('PATH'):
    if which('termux-clipboard-set'):
        os.system("cat /sdcard/HC-Decrypt.txt| termux-clipboard-set")
        print('sukses copy')
    else:
        print('You are using Termux. If you want to copy the result to the clipboard, install the API of Termux')
else:
    try:
        from pyperclip import copy
        copy(msg)
        print('sukses copy')
    except:
        os.system("pip install pyperclip || pip3 install pyperclip")
        from pyperclip import copy
        copy(msg)
        print('sukses copy')
        pass