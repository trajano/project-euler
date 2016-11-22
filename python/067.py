from urllib.request import urlopen
triangle = [
    "3",
    "7 4",
    "2 4 6",
    "8 5 9 3",
]
link = 'https://projecteuler.net/project/resources/p067_triangle.txt'
f = urlopen(link)
triangle = [l.decode() for l in f.readlines()]

h = len(triangle)
sum_triangle = [[-1 for x in range(0, h)] for y in range(h)]
sum_triangle[h - 1] = [int(e) for e in triangle[-1].split(" ")]

for r in range(h - 2, -1, -1):
    sum_triangle[r] = [int(e) for e in triangle[r].split(" ")]
    for i in range(0, len(sum_triangle[r])):
        sum_triangle[r][i] += max(sum_triangle[r + 1][i],
                                  sum_triangle[r + 1][i + 1])

print(sum_triangle[0][0])
