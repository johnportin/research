#!/bin/bash

rm output.txt ideals.json
 
M2 wrapper.m2 

python3 jsonConverter.py