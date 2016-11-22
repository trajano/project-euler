import re
import networkx
from urllib.request import urlopen

link = 'https://projecteuler.net/project/resources/p082_matrix.txt'
f = urlopen(link)
input_matrix = [[int(e) for e in l.decode().split(",")] for l in f.readlines()]

input_matrix = [
    [131, 673, 234, 103, 18],
    [201, 96, 342, 965, 150],
    [630, 803, 746, 422, 111],
    [537, 699, 497, 121, 956],
    [805, 732, 524, 37, 331],
]

# Width of matrix global
w = len(input_matrix)
g = networkx.DiGraph()
g.add_nodes_from(range(0, 25))


def node(i, j):
    global w
    return i * w + j


# set the weight of the edge to the minimum sum given the direction
# returns the minimum weight
def add_edges_from(i, j):
    global input_matrix, w
    base_weight = input_matrix[i][j]
    if (j == w - 1):
        #right edge, stop processing
        return 0
    elif (i == 0):
        # on top can only go down and right
        to_r = base_weight + add_edges_from(i, j + 1)
        to_d = base_weight + add_edges_from(i + 1, j)
        g.add_weighted_edges_from(
            [node(i, j), node(i, j + 1), to_r],
            [node(i, j), node(i + 1, j), to_d], )
        return min(to_r, to_d)
    elif (i == w - 1):
        # on bottom can only go up and right
        to_r = base_weight + add_edges_from(i, j + 1)
        #        to_u = base_weight + add_edges_from(i - 1, j)
        g.add_weighted_edges_from([node(i, j), node(i, j + 1), to_r], )
        #[node(i, j), node(i - 1, j), to_u], )
        return to_r
    else:
        # on middle can only go up, down and right
        to_r = base_weight + add_edges_from(i, j + 1)
        #        to_u = base_weight + add_edges_from(i - 1, j)
        to_d = base_weight + add_edges_from(i + 1, j)
        g.add_weighted_edges_from(
            [node(i, j), node(i, j + 1), to_r],
            [node(i, j), node(i + 1, j), to_d], )
        #[node(i, j), node(i - 1, j), to_u], )
        return min(to_r, to_d)


add_edges_from(0, 0)
print(g.nodes())
