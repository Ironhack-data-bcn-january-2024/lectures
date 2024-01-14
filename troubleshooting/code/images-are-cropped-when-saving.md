1. You encapsulated your plotting code into a function
2. The function creates the plot and saves it
3. Set `bbox_inches='tight'`

`plt.show()` somehow works as a `return` within a function, stopping the code.
