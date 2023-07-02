import re
import os

def indices(lst) : 
    return [index for index, value in enumerate(lst) if "true" in value or "false" in value][-1] + 1

os.system("lua sc_old.lua")
with open("decrypt.txt", mode = "r") as f : 
    content = str(f.read())
    print(content)
    f.close()
content = content.split("\n")
# content = re.sub(r"[\n\r]+","", content)
# content = re.sub(r"\\x00"," ",content)
# content = re.sub(r"\\r","", re.sub(r"\\n","", content))

# if re.search(r"(false|true)[ ]+([^\s]+)[ ]+", content) :
#     separator = re.search(r"(false|true)[ ]+([^\s]+)[ ]+", content).group(2).replace("\\", "\\\\")

# content = re.sub(re.compile(separator),"valdyGanteng",content)
# content = re.sub(r"\\[xX][\w{1}]+","",content)
# content = [x.strip() for x in content.split("valdyGanteng") ]
# content = eval(str(content).replace("'',",""))
# content = content[0:indices(content)]

# with open("test.txt", mode = "w") as f : 
#     f.write(str(content))
#     f.close()

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

# print(content)
# print(len(content))
# print(separator)
checkBegin = re.compile(f"""{regex_config["Payload"]["regex"]}|\d:kosong|\d:temp""")
if (not re.search(checkBegin, content[0]) ) : 
    content = content[1:-1]
# print(content[6])

# print(re.search(regex_config[regex_key]["regex"], eachConfig))

# print(0 in regex_config["Payload"]["range"])
# os.sys.exit(0)

for index, eachConfig in enumerate(content) : 
    # print(eachConfig)

    for regex_key in regex_config : 

        if re.search(regex_config[regex_key]["regex"], eachConfig) and not hasil[regex_key] and index in regex_config[regex_key]["range"]: 
            # print(re.search(regex_config[regex_key]["regex"], eachConfig))
            hasil[regex_key] = re.search(regex_config[regex_key]["regex"], eachConfig).group(1)

            print(f"""</> {regex_key}: {hasil[regex_key]}\n""")
            break

        #     if re.search(regex_config[regex_key], eachConfig) and index in hasil[regex_key]["Jangkauan Index"]: 

        #         hasil[regex_key]["Terisi"] = re.search(regex_config[regex_key], eachConfig).group(1)

        #         print(f"""</> {regex_key}: {hasil[regex_key]["Terisi"]}\n""")
        #         break

# print(content[29])