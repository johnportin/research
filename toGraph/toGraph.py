import matplotlib.pyplot as plt
import os
import sys
import re

y = [1,2,3]
x = [3,2,1]

print(os.listdir())

directory = "./data/dim3"

for file_deg in os.scandir(directory):
    print(file_deg)
    for file_gens in os.scandir(file_deg):
        print(file_gens)
        for file_ideal in os.scandir(file_gens):
            if not file_ideal.is_file():
                for ideal in os.scandir(file_ideal):
                    if ideal.is_file():
                        print(ideal.path)

                        coordinate = []

                        f = open(ideal)
                        for line in f:
                            line_list = line.split()

                            line_list = [int(x) for x in line_list]
                            coordinate.append(line_list)
                        fig = plt.scatter(*zip(*coordinate))
                        print(*zip(*coordinate))

                        myOutputName = ideal.path + "_graph.png"
                        print(myOutputName)
                        plt.title(ideal.name + "_graph")
                        plt.savefig(myOutputName)
                        plt.close()

    print("\n")

