import matplotlib.pyplot as plt
import sys
import csv


data=[]
with open(sys.argv[1]) as f:
    content=csv.reader(f,delimiter=',')
    for row in content:
        data.append(row)

all = int(data[1][0])
active = int(data[1][1])
inactive = all-active
plt.title("Active/Inactive listings on Airbnb")
plt.pie(x = [active,inactive],labels = ["Active", "Inactive"],autopct='%.2f%%')
plt.savefig(sys.argv[2])
