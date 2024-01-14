# Project-1-Pandas
# Overview

This aim of this project is to clean and format a dataset containing information about shark attacks, and use the data to produce visualizations that will either  prove or disprove my hypotheses.
<br>

# Requirements/Libraries Used:
This code was written in Python/Jupyter Notebook, using the following libraries:
<br>
- Numpy
- Pandas
- matplotlib.pyplot
- Seaborn
<br>
 

# Hypotheses:
<br>

## 1- Shark attacks before the year 1980 were always fatal
## 2- Shark attacks in the Southern Hemisphere are more dangerous
## 3- Sharks on the US West Coast are nicer than East Coast Sharks
## 4- A shark attack in Australia carries the highest risk of death

<br>

# Shark attacks before 1980:

In this first inquiry, we recieved conclusive results, albeit with some caveats. An important thing to note when looking at this data: the general reporting of shark attacks between 1900-1950 is not very thorough. 

Therefore, our conclusions about the nature of fatal shark attacks before 1980 should be taken with a grain of salt. That being said, the data is clear: all of the shark attacks recorded before 1920(in our dataset) were fatal, with a signficant portion of the attacks before 1980 also being fatal (but not all)

![year_plot](https://user-images.githubusercontent.com/119608737/215509809-57ab26b0-de65-4517-aaf1-556affd7a9d1.png)

In the violinplot above, we can see that there are NO non-fatal attacks prior to roughlt 1930 (that were recorded). We can also see that there is a significant increase in (reported) attacks overall after 1930, with non-fatal making up the majority of the newer reported attacks

![year_swarm](https://user-images.githubusercontent.com/119608737/215509851-d761fdb8-976e-40f2-ad99-5a28d620a1ba.png)

The swarm chat we see here provides a little bit more detail about the ratio of fatal shark attacks per year. Here we can see that 1940 is really the cutoff date for "fatal-only" shark attacks.


# Shark attacks in the Southern Hemisphere

This inquiry was probably the most conclusive of all my 4 hypotheses. 
<br>

![hemisphere_heatmap](https://user-images.githubusercontent.com/119608737/215509598-8462c0b8-e27e-469d-9141-a224d1b5b701.png)

In this heatmap, we can see very clearly that there is a huge difference is total number of fatal shark attacks per hemisphere, with the southern hemisphere being by far more life-threatening. 

![hemisphere_bar](https://user-images.githubusercontent.com/119608737/215509630-307aca40-f7a1-4e61-a328-7d0bc732d286.png)

We can also see that there is a significant difference in overall total attacks; with the Northern hemisphere being largely safer than the South when we look at non-fatal attacks


# Shark attacks on the West vs East Coast of the USA

My intitial thought was that West Coast sharks would be as mellow as their land locked neighbors in California and Oregon. However, the numbers proved that my initial expectations were far from correct:

![us_attack_heatmap](https://user-images.githubusercontent.com/119608737/215509921-8b3c2c3a-48c6-47e4-92d6-7ebfceba38d8.png)

In fact, we can very clearly see two things:
1. There is no difference in fatal shark attacks when we look at both coasts
2. West Coast sharks attack more frequent overall, meaning that while you're more likely to get attacked on the west coast, you're less likely to die because of it

![us_attack_bar](https://user-images.githubusercontent.com/119608737/215509956-7cf78d25-ac92-4c96-bc2a-d7da89f63065.png)

As we can see in this graph, the West Coast represents a much larger proportion of overall shark attacks in the US. From this data we can also see that the ratio of fatal:non-fatal attacks is *WORSE* in the East, meaning a East Coast shark is more likely to kill you. (this kind of proves my theory, but not really)

# Shark attacks in Australia have the highest chance of fatality.

We already know that the sharks in the Southern hemisphere are way more likely to kill you. It stands to reason that sharks from Australia (also known as the country where everything wants to kill you) are more likely to be involved in fatal attacks. And the survey says....

![dangerous_waters](https://user-images.githubusercontent.com/119608737/215501493-8b7a0531-7ff2-49e8-aeeb-ef0f8c93f476.png)


The answer should come as no surprise: If you're a human and you live in Australia....leave. Interestingly, the United States has a much higher frequency of shark attacks, but the sharks take pity on American swimmers at a much higher rate than Australian sharks. 

# In Conclusion
- Be glad you were born in this era, otherwise you'd probably be dead already due to shark attack
- If you live south of the Ecuator, reconsider swimming
- If you live in the US, move to the West Coast: the sharks are friendlier ;)
- If you're Australian, don't trust any sharks

