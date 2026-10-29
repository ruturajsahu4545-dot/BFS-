{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyN79Fwt09Vu5xfnw8VsJhNf",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/ruturajsahu4545-dot/BFS-/blob/main/tsp\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {
        "id": "yEMjq1INDFZl"
      },
      "outputs": [],
      "source": [
        "from itertools import permutations\n",
        "\n",
        "# Function to solve TSP\n",
        "def travelling_salesman(graph, start):\n",
        "    cities = list(range(len(graph)))\n",
        "    cities.remove(start)\n",
        "    min_cost = float('inf')\n",
        "    best_path = None\n",
        "\n",
        "    # Generate all possible tours\n",
        "    for perm in permutations(cities):\n",
        "        current_cost = 0\n",
        "        current_path = [start]\n",
        "        k = start\n",
        "\n",
        "        for city in perm:\n",
        "            current_cost += graph[k][city]\n",
        "            current_path.append(city)\n",
        "            k = city\n",
        "\n",
        "        current_cost += graph[k][start]\n",
        "        current_path.append(start)\n",
        "\n",
        "        if current_cost < min_cost:\n",
        "            min_cost = current_cost\n",
        "            best_path = current_path\n",
        "\n",
        "    return best_path, min_cost\n",
        "\n",
        "\n",
        "# Main Program\n",
        "n = int(input(\"Enter the number of cities: \"))\n",
        "\n",
        "print(\"Enter the cost matrix:\")\n",
        "graph = []\n",
        "\n",
        "for i in range(n):\n",
        "    row = list(map(int, input().split()))\n",
        "    graph.append(row)\n",
        "\n",
        "start = int(input(\"Enter the starting city (0 to {}): \".format(n - 1)))\n",
        "\n",
        "path, cost = travelling_salesman(graph, start)\n",
        "\n",
        "print(\"\\nOptimal Path:\", \" -> \".join(map(str, path)))\n",
        "print(\"Minimum Cost:\", cost)"
      ]
    }
  ]
}

output:
Enter the number of cities: 3
Enter the cost matrix:
0 45 56
45 0 78
56 78 0
Enter the starting city (0 to 2): 2

Optimal Path: 2 -> 0 -> 1 -> 2
Minimum Cost: 179
