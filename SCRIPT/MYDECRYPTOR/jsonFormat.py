import json
import re

with open("json.txt", mode = "r") as f : 
    dataJson = re.sub(r"({(.*)})(.*)",r"\1", f.read())
    f.close()

FormattedJson = json.dumps(json.loads(dataJson), indent = 4)

with open("jsonParse.txt", mode = "w") as f : 
    f.write(FormattedJson)
    f.close()

