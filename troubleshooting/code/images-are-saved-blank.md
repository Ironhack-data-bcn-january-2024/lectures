1. You encapsulated your plotting code into a function
2. The function creates the plot but either is not exported or is exported blank
3. Make sure your first save the figure AND THEN you do use `plt.show()`

`plt.show()` somehow works as a `return` within a function, stopping the code.
