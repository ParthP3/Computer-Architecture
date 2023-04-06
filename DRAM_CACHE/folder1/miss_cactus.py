import matplotlib.pyplot as plt
import numpy as np
from sys import argv

X = ['1', '4', '16', '32']

Y_LRU      =  [1, 308012/320134, 249540/320134, 0.75]
Y_LFU      =  [1, 301391/320117, 245885/320173, 0.69]
Y_RANDOM   =  [1, 301858/320175, 254156/320111, 0.72]
Y_FIFO     =  [1, 308012/320134, 249540/320134, 0.75]

#for i in range(4):
#   x = max(Y_LRU[i], Y_LFU[i], Y_RANDOM[i], Y_FIFO[i]) - min((Y_LRU[i], Y_LFU[i], Y_RANDOM[i], Y_FIFO[i]))
#   mean = (Y_LRU[i]+Y_LFU[i]+Y_RANDOM[i]+Y_FIFO[i])/4.00
#   if x == 0:
#       x = 1
#   a = 0.400/x
#   print(x)
#   mean*=a
#   Y_LRU[i]=Y_LRU[i]*a - mean + 1
#   Y_LFU[i]=Y_LFU[i]*a - mean + 1
#   Y_RANDOM[i]=Y_RANDOM[i]*a - mean + 1
#   Y_FIFO[i]=Y_FIFO[i]*a - mean + 1


X_axis = np.arange(len(X))
plt.bar(X_axis-0.15, Y_LRU, 0.1, label = "LRU")
plt.bar(X_axis-0.05, Y_LFU, 0.1, label = "LFU")
plt.bar(X_axis+0.05, Y_RANDOM, 0.1, label = "RANDOM")
plt.bar(X_axis+0.15, Y_FIFO, 0.1, label = "FIFO")

plt.xticks(X_axis, X)
plt.xlabel("NUMBER OF WAYS")
plt.ylabel("LLC_MISS_RATE")
plt.title(f"LLC Miss rate versus Number of Ways for cactus")
plt.legend()
plt.show()