import re
import networkx
from urllib.request import urlopen

link = 'https://projecteuler.net/project/resources/p082_matrix.txt'
f = urlopen(link)
input_matrix = [[int(e) for e in l.decode().split(",")] for l in f.readlines()]

xinput_matrix = [
    [131, 673, 234, 103, 18],
    [201, 96, 342, 965, 150],
    [630, 803, 746, 422, 111],
    [537, 699, 497, 121, 956],
    [805, 732, 524, 37, 331],
]


def to_2d_internal(input_tuple, width):
    if len(input_tuple) == 0:
        return []
    else:
        return [input_tuple[0:width]] + to_2d_internal(input_tuple[width:],
                                                       width)


"""
Convert input string to a 2D array of integers
"""


def to_2d(input, width):
    input_tuple = [
        int(numeric_string)
        for numeric_string in re.split(",|\s+", input.lstrip().rstrip())
    ]
    return to_2d_internal(input_tuple, width)


current_min = 380000


def min_sum_at_path(input_matrix, x, y, current_sum, path):
    global current_min
    width = len(input_matrix[0])
    current_sum += input_matrix[x][y]
    path = path + [(x, y)]
    if current_sum > current_min:
        return current_min
    if y == (width - 1):
        if current_sum < current_min:
            print(str(path) + " = " + str(current_sum))
            current_min = current_sum
        return current_min

    sum_going_up = current_min
    sum_going_right = current_min
    sum_going_down = current_min

    if (y < width - 1):
        sum_going_right = min_sum_at_path(input_matrix, x, y + 1, current_sum,
                                          path)
    if (x < width - 1):
        sum_going_down = min_sum_at_path(input_matrix, x + 1, y, current_sum,
                                         path)
    if (x > 0):
        sum_going_up = min_sum_at_path(input_matrix, x - 1, y, current_sum,
                                       path)

    return min(sum_going_right, sum_going_down, sum_going_up)


def three_way_minimal_path_sum(input_matrix, x, y):
    width = len(input_matrix[0])
    for x in range(0, width):
        min_sum_at_path(input_matrix, x, 0, 0, [])
    return current_min


minpath_matrix = None


def seed_minpath_matrix(input_matrix):
    global minpath_matrix
    w = len(input_matrix)
    minpath_matrix = [[-1 for x in range(0, w)]
                      for y in range(len(input_matrix))]
    for i in range(0, w):
        minpath_matrix[i][w - 1] = input_matrix[i][w - 1]


def calculate_minpath(input_matrix, minpath_matrix, i, j):
    w = len(input_matrix)
    if (minpath_matrix[i][j] != -1):
        return minpath_matrix[i][j]
    if (minpath_matrix[i][j] == -2):
        return 9999999
    minpath_matrix[i][j] = -2
    if (j == w - 1):
        minpath_matrix[i][j] = input_matrix[i][j]

    elif (i == 0):
        #print("Z")
        minpath_matrix[i][j] = input_matrix[i][j] + min(
            calculate_minpath(input_matrix, minpath_matrix, i, j + 1),
            calculate_minpath(input_matrix, minpath_matrix, i + 1, j))
    elif (i == w - 1):
        #print("Y")
        minpath_matrix[i][j] = input_matrix[i][j] + min(
            calculate_minpath(input_matrix, minpath_matrix, i - 1, j),
            calculate_minpath(input_matrix, minpath_matrix, i, j + 1))
    else:
        #print("X" + str([i, j, w]))
        minpath_matrix[i][j] = input_matrix[i][j] + min(
            min(
                calculate_minpath(input_matrix, minpath_matrix, i, j + 1),
                calculate_minpath(input_matrix, minpath_matrix, i - 1, j),
                calculate_minpath(input_matrix, minpath_matrix, i + 1, j)),
            min(
                calculate_minpath(input_matrix, minpath_matrix, i - 1, j),
                calculate_minpath(input_matrix, minpath_matrix, i + 1, j),
                calculate_minpath(input_matrix, minpath_matrix, i, j + 1)),
            min(
                calculate_minpath(input_matrix, minpath_matrix, i + 1, j),
                calculate_minpath(input_matrix, minpath_matrix, i - 1, j),
                calculate_minpath(input_matrix, minpath_matrix, i, j + 1)))
    print([i, j, minpath_matrix[i][j]])
    return minpath_matrix[i][j]


def column(matrix, i):
    return [row[i] for row in matrix]


seed_minpath_matrix(xinput_matrix)
calculate_minpath(xinput_matrix, minpath_matrix, 0, 0)

print(min(column(minpath_matrix, 0)))
for x in minpath_matrix:
    print(x)
