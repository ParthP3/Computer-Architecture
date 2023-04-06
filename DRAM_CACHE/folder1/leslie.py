import matplotlib.pyplot as plt
import pandas as pd

r = pd.read_csv("plot_leslie.csv")

df = pd.DataFrame(r)


X = list(df.iloc[:, 0])
Y = list(df.iloc[:, 1])

plt.bar(X, Y,  width=1.5, color='g')
plt.title("Offset scores for Leslie data set")
plt.xlabel("Offsets")
plt.ylabel("Scores")
  
# Show the plot
plt.show()