import matplotlib
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

import os
import sys
import re

dir_list = os.listdir()

print(dir_list)

file = "newfile.txt"

with open(file, 'w') as fp:
    fp.write("new file")

print(os.listdir())

plt.switch_backend('agg')


# fig = plt.figure(figsize=(10, 10))
ax = plt.axes(projection='3d')

X = [1,2,3]
Y = [3,2,1]
Z = [1, 1, 2]

print(os.curdir)

# plt.figure()
ax.scatter(X, Y, Z)
plt.savefig("test.png")
plt.close()

print("made it to the end")
print(os.listdir())
