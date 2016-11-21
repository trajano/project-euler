import re
from urllib.request import urlopen

link = 'https://projecteuler.net/project/resources/p082_matrix.txt'
f = urlopen(link)
input_matrix = [l.split(",") for l in f.readline()]

print(input_matrix)
