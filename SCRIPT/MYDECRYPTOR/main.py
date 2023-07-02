# -*- coding: utf-8 -*-

import os
import re

def indices(lst) : 
    return [index for index, value in enumerate(lst) if value in ["true","false"]][-1] + 1

def safeprint(s, end = "\n") :
    try:
        print(s,end = end)
    except UnicodeEncodeError:
        if os.sys.version_info >= (3,):
            print(s.encode('utf-8').decode(os.sys.stdout.encoding), end = end)
        else:
            print(s.encode('utf-8'), end = end)
        
def getIndex(match,data) : 
    result = []
    for index, val in enumerate(data) : 
        if match in val : result.append(index)
    return result[-1] if result else None


filename = "decrypt_8.txt"

if __name__ == "__main__" and filename in os.listdir() : 

    os.system(f"strings {filename} > parseDecrypt.txt")
    regex_config = {
        "Payload" : r"((GET|HEAD|POST|PUT|DELETE)[\w\/\:\ \[\]\.\-]+\])",
        "AkunSSH" : r"([\w\-\.]+:[\d]+@[\w\-\.]+:[\w]+)",
        "Proxy" : r"((?:[\w-]+\.)*[\w-]{1,63}(?:\.(?:\w{3}|\w{2})):(?:\d{2,}))",
        "ExpiryTime" : r"(lifeTime|\d{4}-\d{2}-\d{2} \d{2}:\d{2})",
        "SNI" : r"([\w\-\.]+\.\w{2,3})",
        "V2Ray" : r"inbounds",
    }

    hasil = {
        "Payload" : None,
        "AkunSSH" : None,
        "Proxy" : None,
        "ExpiryTime" : None,
        "SNI" : None,
        "V2Ray" : None,
    }

    # with open("decrypt.txt", mode = "rb") as f : 
    #     dataConfig = str(f.read()).replace("b\'"," ")
    #     removeNonAscii = re.sub(r"[\n\"\']","",re.sub(r"\\x00"," ", dataConfig))
    #     separator = re.search(r"(false|true)\ +([\w\\]+)", removeNonAscii).group(2)
        
    #     for config in dataConfig.split(separator) : 
    #         config = config.replace("\\x00"," ")

    #         for key in regex_config : 
                
    #             if re.search(regex_config[key], config) and not hasil[key]  : 
    #                 hasil[key] = re.search(regex_config[key], config).group(1)
    #                 break

    with open("parseDecrypt.txt", mode = "r") as f : 
        # content = re.sub(r"\w{1}\n","",f.read()).replace("\n","VALDY")

        # content = "".join([match.strip() + "\n" for match in f.read().splitlines() if not (len(match.strip()) > 1 and len(match.strip()) <= 5) ])
        content = f.read()
        contentSplitLines = content.splitlines()[0:100]
        f.close()

    lifeTimeIndex = getIndex(re.search(re.compile(regex_config["ExpiryTime"]), content).group(1), contentSplitLines)

    # print(contentSplitLines[lifeTimeIndex])
    # print()
    # print(lifeTimeIndex)
    # print()
    # print(contentSplitLines)
    # os.sys.exit(0)

    if not re.search(re.compile("(false|true)"), contentSplitLines[lifeTimeIndex - 1]) : 

        separator = contentSplitLines[lifeTimeIndex - 1]        
        contentSplitLines = [val.strip().replace("\n","") for val in content.split(separator)]

    elif not re.search(re.compile("(false|true)"), contentSplitLines[lifeTimeIndex + 1]) : 

        separator = contentSplitLines[lifeTimeIndex + 1]
        contentSplitLines = [val.strip().replace("\n","") for val in content.split(separator)]
    
    
    # separator = re.search(re.compile("(false|true)[\ ]+(\w{" + str(limitSeparator) + ",})[\ ]+"), content).group(2)

    
    for index, eachConfig in enumerate(contentSplitLines) : 

        for regex_key in regex_config : 

            if re.search(regex_config[regex_key], eachConfig) and not hasil[regex_key] : 

                # if regex_key == "SNI" and "could not" in os.popen(f"ping {re.search(regex_config[regex_key], eachConfig).group(1)}").read() :  
                #     break

                if regex_key == "SNI" and not hasil["ExpiryTime"] :  
                    break

                hasil[regex_key] = re.search(regex_config[regex_key], eachConfig).group(1)

                safeprint(f"\u2794 {regex_key}: {hasil[regex_key]}\n")
                break

    # os.remove("parseDecrypt.txt")
else :
    print("Sorry Data Kosong")