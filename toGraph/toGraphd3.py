import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection


import numpy as np

import itertools


import os
import sys
import re


directory = "./data/ideals/dim3"

for file_deg in os.scandir(directory):
    print(file_deg)
    for file_gens in os.scandir(file_deg):
        print(file_gens)
        for file_ideal in os.scandir(file_gens):
            if not file_ideal.is_file():
                for ideal in os.scandir(file_ideal):
                    if ideal.is_file() and not ideal.name.endswith('.png') and not ideal.name.endswith('.html'):
                        print(ideal.path)

                        coordinate = []
                        total = []

                        fig, ax = plt.subplots()

                        f = open(ideal)
                        for line in f:
                            line_list = line.split()
                            [total.append(int(x)) for x in line_list]

                            line_list = [int(x) for x in line_list]

                            coordinate.append(line_list)
                        ax.scatter(*zip(*coordinate))

                        # maxDegree = max(coordinate)
                        # print("total = ", total)
                        # print("coord = ", coordinate)
                        maxDegree = max(total)
                        gap = []

                        coordinate = [tuple(x) for x in coordinate]

                        for i in range(0, maxDegree):
                            for j in range(0, maxDegree):
                                    if (i, j) not in coordinate and i + j <= maxDegree:
                                        gap.append((i,j))

                        if len(gap) > 0:
                            lines = []
                            ax.scatter(*zip(*gap), c='red')

                            K = []

                            for g in list(gap):
                                gl = list(g)
                                gl.append(maxDegree - sum(gl))
                                K.append(gl)

                            

                            # Compute lines between gap elements
                            print("complateGap = ", K)
                            for p in itertools.product(K, K):
                                print("p = ", p)
                                for z in zip(*p):
                                    print("\t", z)
                                
                                distance = [abs(x - y) for x,y in zip(*p)]
                                print("\t\t", distance)

                                if max(distance) == 1:
                                    print("distance from ", p[0], " to ", p[1], " = ", max(distance))
                                    lines.append((p[0][:2], p[1][:2]))

                            lc = LineCollection(lines, colors='red', linewidths=2)
                            # fig, ax = pl.subplots()
                            ax.add_collection(lc)

                        myOutputName = ideal.path + "_graph.png"

                        plt.savefig(myOutputName)

                        plt.close()
                        f.close()

    print("\n")

