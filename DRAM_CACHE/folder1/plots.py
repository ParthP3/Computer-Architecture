import matplotlib.pyplot as plot
import pandas as pd
# Make a data definition
_data = {'NO': [0.63756, 1.18575, 0.854609, 0.444065],
        'BOP': [1.02311, 1.19094, 0.860262, 0.518739]}
_df = pd.DataFrame(_data,columns=['NO', 'BOP'], index = ['SPHINX', 'GCC', 'PERLBENCH', 'CACTUS'])
 
# Multiple horizontal bar chart
_df.plot.bar()

# Display the plot
plot.show()