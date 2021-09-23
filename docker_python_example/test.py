import matplotlib
import pandas
import sys
import configparser


config = configparser.ConfigParser()
config.read(sys.argv[1])
print(config['settings']['dim'])

print("hi bitches... err... hello world!")
