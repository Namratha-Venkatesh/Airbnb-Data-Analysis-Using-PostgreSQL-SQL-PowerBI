import sys
import csv
import string

def prepare_number(text):
    if text == "N/A": return None
    if text.replace("\"","").replace(",", "").replace(".", "").replace("$","").replace("%","").isdigit():
       return text.replace(",","").replace("$","").replace("%","")
    return text


res=[]
with open(sys.argv[1]) as f:
    content=csv.reader(f,delimiter=',')
    for row in content:
        for str in range (len(row)):
            row[str]=prepare_number(row[str])
        res.append(row)
    f.close()

with open(sys.argv[1],'w') as ff:
    sw=csv.writer(ff,delimiter=',')
    for rows in res:
        sw.writerow(rows)
ff.close()
