import matplotlib.pyplot as plt
import numpy as np
from sys import argv

X = ['1', '4', '16', '32']

Y_LRU      =  [2807869/3102126, 1556932/3102126, 6325/3109253, 6325/3109253]
Y_LFU      =  [2809469/3103664, 1212973/3108740, 6325/3110114, 6325/3110114]
Y_RANDOM   =  [2809469/3103664, 1111845/3105247, 6346/3108763, 6346/3108763]
Y_FIFO     =  [2807869/3102126, 1270434/3102126, 6468/3109253, 6468/3109253]


X_axis = np.arange(len(X))
plt.bar(X_axis-0.15, Y_LRU, 0.1, label = "LRU")
plt.bar(X_axis-0.05, Y_LFU, 0.1, label = "LFU")
plt.bar(X_axis+0.05, Y_RANDOM, 0.1, label = "RANDOM")
plt.bar(X_axis+0.15, Y_FIFO, 0.1, label = "FIFO")

plt.xticks(X_axis, X)
plt.xlabel("NUMBER OF WAYS")
plt.ylabel("LLC_MISS_RATE")
plt.title(f"LLC Miss rate versus Number of Ways for gcc")
plt.legend()
plt.show()
plt.savefig("images/gcc.png")