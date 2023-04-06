import matplotlib.pyplot as plt
import numpy as np
from sys import argv

X = ['1', '4', '16', '32']

Y_LRU      =  [666794/669500, 650768/669505, 584381/669507, 457150/668011]
Y_LFU      =  [668198/670872, 608197/670068, 407506/668854, 91348/668932]
Y_RANDOM   =  [668198/670872, 645210/669549, 517924/668545, 140652/668529]
Y_FIFO     =  [666794/669500, 650065/669506, 592103/669504, 366783/668013]

# for i in range(4):
#    x = max(Y_LRU[i], Y_LFU[i], Y_RANDOM[i], Y_FIFO[i]) - min((Y_LRU[i], Y_LFU[i], Y_RANDOM[i], Y_FIFO[i]))
#    mean = (Y_LRU[i]+Y_LFU[i]+Y_RANDOM[i]+Y_FIFO[i])/4.00
#    if x == 0:
#        x = 1
#    a = 0.400/x
#    print(x)
#    mean*=a
#    Y_LRU[i]=Y_LRU[i]*a - mean + 1
#    Y_LFU[i]=Y_LFU[i]*a - mean + 1
#    Y_RANDOM[i]=Y_RANDOM[i]*a - mean + 1
#    Y_FIFO[i]=Y_FIFO[i]*a - mean + 1


X_axis = np.arange(len(X))
plt.bar(X_axis-0.15, Y_LRU, 0.1, label = "LRU")
plt.bar(X_axis-0.05, Y_LFU, 0.1, label = "LFU")
plt.bar(X_axis+0.05, Y_RANDOM, 0.1, label = "RANDOM")
plt.bar(X_axis+0.15, Y_FIFO, 0.1, label = "FIFO")

plt.xticks(X_axis, X)
plt.xlabel("NUMBER OF WAYS")
plt.ylabel("LLC_MISS_RATE")
plt.title(f"LLC Miss rate versus Number of Ways for sphinx")
plt.legend()
plt.show()