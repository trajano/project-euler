import re
from urllib.request import urlopen

link = 'https://projecteuler.net/project/resources/p082_matrix.txt'
f = urlopen(link)
input_matrix = [int(e) for e in [l.split(",") for l in f.readline()]]

print(input_matrix)

input_width = 80

xinput = """
131 673 234 103  18
201  96 342 965 150
630 803 746 422 111
537 699 497 121 956
805 732 524  37 331
"""
xinput_width = 5


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


def build_minpath_matrix(input_matrix):
    global minpath_matrix
    minpath_matrix = [[-1 for x in range(len(input_matrix))]
                      for y in range(len(input_matrix))]
    for w in range(len(input_matrix) - 1, -1, -1):
        for j in range(len(input_matrix) - 1, -1, -1):
            calculate_minpath(input_matrix, minpath_matrix, w, j)


def calculate_minpath(input_matrix, minpath_matrix, i, j):
    w = len(input_matrix)
    if (minpath_matrix[i][j] != -1):
        return minpath_matrix[i][j]
    minpath_matrix[i][j] = 99999999
    if (j == w - 1):
        minpath_matrix[i][j] = input_matrix[i][j]

    elif (i < w - 1) and (i > 0):
        minpath_matrix[i][j] = input_matrix[i][j] + min(
            calculate_minpath(input_matrix, minpath_matrix, i, j + 1),
            calculate_minpath(input_matrix, minpath_matrix, i - 1, j),
            calculate_minpath(input_matrix, minpath_matrix, i + 1, j))
    elif (i == 0):
        minpath_matrix[i][j] = input_matrix[i][j] + min(
            calculate_minpath(input_matrix, minpath_matrix, i, j + 1),
            calculate_minpath(input_matrix, minpath_matrix, i + 1, j))
    elif (i == w - 1):
        minpath_matrix[i][j] = input_matrix[i][j] + min(
            calculate_minpath(input_matrix, minpath_matrix, i, j + 1),
            calculate_minpath(input_matrix, minpath_matrix, i - 1, j))
    else:
        throw
    return minpath_matrix[i][j]


input_matrix = to_2d(input, input_width)
build_minpath_matrix(input_matrix)
#print(
for x in input_matrix:
    print(x)
print()
for x in minpath_matrix:
    print(x)


def column(matrix, i):
    return [row[i] for row in matrix]


print(min(column(minpath_matrix, 0)))

#print(three_way_minimal_path_sum(input_matrix, 0, 0))
