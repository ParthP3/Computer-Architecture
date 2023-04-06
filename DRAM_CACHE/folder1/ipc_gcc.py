import matplotlib.pyplot as plt
import numpy as np
from sys import argv

X = ['1', '4', '16', '32']

Y_LRU      =  [0.614727, 0.615479, 0.638348, 0.710668]
Y_LFU      =  [0.621953, 0.638277, 0.751612, 1.04091]
Y_RANDOM   =  [0.621953, 0.615479, 0.668913, 0.968188]
Y_FIFO     =  [0.614727, 0.614849, 0.633556, 0.76208]


X_axis = np.arange(len(X))
plt.bar(X_axis-0.15, Y_LRU, 0.1, label = "LRU")
plt.bar(X_axis-0.05, Y_LFU, 0.1, label = "LFU")
plt.bar(X_axis+0.05, Y_RANDOM, 0.1, label = "RANDOM")
plt.bar(X_axis+0.15, Y_FIFO, 0.1, label = "FIFO")

plt.xticks(X_axis, X)
plt.xlabel("NUMBER OF WAYS")
plt.ylabel("IPC")
plt.title(f"IPC versus Number of Ways for gcc")
plt.legend()
plt.show()
plt.savefig("images/gcc.png")