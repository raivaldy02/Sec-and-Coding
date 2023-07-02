import binascii
import re
import os
from shutil import which

def hexdecode(hex_str):
    return "".join((map(lambda x : binascii.unhexlify(x).decode(), hex_str.split("\x20"))))

def hexencode(hex_str):
    return binascii.hexlify(hex_str).decode()

def getProperties(content_str) : 
    start_idx = "<properties>"
    end_idx = "</properties>"
    pattern_sub_idx = re.compile(f"(.*){start_idx}(.*){end_idx}")
    content_str = re.sub(pattern_sub_idx, r"\2", content_str)
    content_str = content_str.replace("\""," DoubleQuote ")

    cfgContent = list()

    for value in content_str.split("valdyGanteng") :

        checkCfg = re.search(r"<entry key= DoubleQuote (.*) DoubleQuote />", value)
        checkCfgWvalue = re.search(r"<entry key= DoubleQuote (.*?) DoubleQuote >(.*?)</entry>", value)

        if checkCfg : 
            key_cfg = checkCfg.group(1)
            value_cfg = "KOSONG"
        elif checkCfgWvalue : 
            key_cfg = checkCfgWvalue.group(1)
            value_cfg = checkCfgWvalue.group(2)
        else :
            continue

        cfgContent.append(f"{key_cfg}batas{value_cfg}") 
    # print([x.split("batas")[0] for x in cfgContent])
    return cfgContent

def getOutput(tbl) : 

    cfgContent = [
        'loginHome',
        'proxyuser',
        'checkRoot',
        'sshUser',
        'sslProtocol',
        'proxypass',
        'sshServer',
        'sshPass',
        'sslHost',
        'cUUID',
        'LockHost',
        'HWID',
        'file.askLogin',
        'dnspu',
        'dnsst',
        'dnsnameserver',
        'file.validate',
        'tunnelType',
        'dnsResolver',
        'sshPort',
        'udpResolver',
        'file.appVersionCode',
        'dnsForward',
        'userProxyAuthentication',
        'proxyRemotePort',
        'file.msg',
        'proxyPayload',
        'proxyRemote',
        'udpForward',
        'file.protection',
        'userDefaultPayload',
        'sshPortLocal'
    ]

    msg = "DECRYPT\n"

    for i, v in enumerate(tbl) : 
        for indexCfgContent, valueCfgContent in enumerate(cfgContent) :

            key_cfg = v.split("batas")[0]
            value_cfg = v.split("batas")[1]

            if key_cfg == valueCfgContent :
                msg += f"{cfgContent[indexCfgContent]} =>\n{value_cfg}\n\n"
                break
            else : 
                msg += f"{key_cfg} =>\n{value_cfg}\n\n"
                break
    
    msg += "DECRYPT SUKSES"

    return msg
        

with open(file = "/sdcard/decrypt.txt", mode = "rb") as f :
    content = str(f.read())[2:-1]
    f.close()

data = re.sub(r"\\x\w{2,2}","", content)
data = re.sub(r"\\r\\n","[crlf]", data)
data = re.sub(r"\\n","valdyGanteng", data)
data = getProperties(data)
msg = getOutput(data)
print(msg)

out = open('/sdcard/DecryptMessage.txt', 'w')
out.write(msg)
out.close()

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
        pass