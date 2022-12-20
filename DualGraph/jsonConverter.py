import json

filename = "output.txt"

dict = []

with open(filename) as outputFile:
    current = {}
    for line in outputFile:
        try:
            name, description = line.strip().split(" ", 1)
        except: 
            name = line
            description = " "
        

        current[name] = description.strip()

        if name == "missing":          
            dict.append(current)  
            current = {}

        print(current, '\n', '\t', name, description)

outFile = open("ideals.json", "w")
json.dump(dict, outFile, indent = 4, sort_keys = False)
outFile.close()