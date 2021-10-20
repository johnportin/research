import matplotlib.pyplot as plt
import mpld3
from mpl_toolkits.mplot3d import Axes3D 
from mpl_toolkits.mplot3d.art3d import Line3DCollection as mc

import numpy as np

import itertools


import os
import sys
import re


directory = "./data/ideals/dim4"

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

                        fig = plt.figure(figsize=(10, 10))

                        ax = plt.axes(projection='3d')


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
                                for k in range(0, maxDegree):
                                    if (i, j, k) not in coordinate and i + j + k <= maxDegree:
                                        gap.append((i,j,k))

                        if len(gap) > 0:
                            lines = []
                            ax.scatter(*zip(*gap), c='red')
                            K = []

                            for g in list(gap):
                                gl = list(g)
                                gl.append(maxDegree - sum(gl))
                                K.append(gl)

                            # Compute lines between gap elements
                            for p in itertools.product(K, K):
                                print("p = ", p)
                                for z in zip(*p):
                                    print("\t", z)
                                
                                distance = [abs(x - y) for x,y in zip(*p)]
                                print("\t\t", distance)

                                if max(distance) == 1:
                                    print("distance from ", p[0], " to ", p[1], " = ", max(distance))
                                    lines.append((p[0][:-1], p[1][:-1]))


                            lc = mc(lines, colors='red', linewidths=2)
                            # fig, ax = pl.subplots()
                            ax.add_collection(lc)
                            # ax.autoscale()
                            # ax.margins(0.1)


                        # print(gap)

                        angles = [(0, 0), (0, 45), (20, 0), (20, 30), (20, 60), (20, 90)]

                        myOutputName = ideal.path + "_graph"
                        for angle in angles:
                            newOutputName = myOutputName + "_" + str(angle[0]) + "_" + str(angle[1])
                            ax.view_init(angle[0], angle[1])
                            # mpld3.save_html(fig, newOutputName + ".html")
                            plt.savefig(newOutputName + ".png")


                        

                        
                        # print(myOutputName)
                        # # plt.title(ideal.name + "_graph")

                        # # Change angle
                        # ax.view_init(20, 0)
                        # plt.savefig(myOutputName + "_20_0")

                        # ax.view_init(20, 30)
                        # plt.savefig(myOutputName + "_20, 30")

                        # ax.view_init(20, 60)
                        # plt.savefig(myOutputName + "_20_60")

                        # ax.view_init(20, 90)
                        # plt.savefig(myOutputName + "_20_90")

                        # ax.view_init(0, 0)
                        # plt.savefig(myOutputName + "_0_0")

                        # ax.view_init(0, 0)
                        # plt.savefig(myOutputName + "_0_45")



                        plt.close()
                        f.close()

    print("\n")

