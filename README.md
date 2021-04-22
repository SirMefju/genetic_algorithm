# Genetic Algorithm
Genetic Algorithm (GA) is a search-based optimization technique based on the principles of Genetics and Natural Selection. It is frequently used to find optimal or near-optimal solutions to difficult problems which otherwise would take a lifetime to solve. It is frequently used to solve optimization problems, in research, and in machine learning.
## Table of Contents
* [Description](#description)
* [Example](#example)
* [Tests](#tests)
* [Conclusions](#conclusions)

## Description
Genetic algorithm will find the maximum of function. Every chromosomes are coded binary and selected by the roulette method.
The original population was randomly initiated, while on the basis of the defined fit function:  
```R
adaptionFunction <- function(X) {return(0.2 * X^3 + 0.1 * X^2 -8 * X)}
```
the quality of solutions in a given population is assessed. This allows the selection of better suited candidates who will be the basis for the creation of the next generation in the next stages. The chromosome is represented by a real number in the range `<-7;7>`.  
Good chromosomes are those for which the value of the function `0.2 * X^3 + 0.1 * X^2 -8 * X` it is close to the maximum value of this function in a given range, it is `<-7;7>`. 
```
For example:  
Test n1: 28.076,   
Test n2: 22.53667,   
Test n3: 22.46333.  
```
Adaptional function also called the fit function or judgment function, it is a measure of the fitness (fit) of an individual in a population. On its basis, we evaluate the degree of adaptation of a given individual in the population and select the individual with the highest value of the fitness function is the maximized function. It has one argument representing the solution.

## Example:
### Population: *(10)*
-|1|2|3|4
-|-|-|-|-
1|0|0|0|1
2|0|0|1|0
3|0|0|1|0
4|0|0|1|0
5|1|1|1|0
6|0|0|0|1
7|0|1|0|1
8|0|0|0|0
9|0|1|0|0
10|0|0|1|0
### Crossing: *(0.3)*
-|1|2|3|4
-|-|-|-|-
1|0|1|0|1
2|0|1|0|0
3|0|0|0|1
4|0|0|1|0
5|0|1|0|1
6|0|0|0|1
7|0|1|1|0
8|0|0|0|0
9|0|0|0|0
10|0|1|1|0
### Mutation: *(0.1)*
-|1|2|3|4
-|-|-|-|-
1|0|1|0|1
2|0|1|0|0
3|0|0|0|1
4|0|0|1|1
5|0|1|1|1
6|0|1|0|1
7|0|1|1|1
8|0|0|0|0
9|0|0|0|0
10|0|0|1|0
### Average adaptation value: 5.701429
### Epoch: 7


## **Tests**:
Test Number|Population Size|Crossing Probability|Mutation Probability|Found Solution|Number of Iterations
-----------|---------------|--------------------|--------------------|--------------|--------------------
1|10|0.3|0.1|28.076|5
2|10|0.3|0.01|22.53667|6
3|10|0.5|0.1|22.46333|6
4|10|0.5|0.01|18.41|4
5|10|0.7|0.1|23.921|10
6|10|0.7|0.01|17,26857|7
7|10|0|0.1|22.5375|12
8|10|0|0.01|10.8625|4
9|10|1|0.1|24.48714|7
10|10|1|0.01|24.04833|6
###
Trial Number|Population Size|Crossing Probability|Mutation Probability|Found Solution|Number of Iterations
-----------|---------------|--------------------|--------------------|--------------|--------------------
1.1|10|0.3|0.1|26.09909|11
1.2|10|0.3|0.1|28.076|5
1.3|10|0.3|0.1|24.85143|7
1.4|10|0.3|0.1|20.50889|9
1.5|10|0.3|0.1|21.114|5
2.1|10|0.3|0.01|15.0175|4
2.2|10|0.3|0.01|7.04|2
2.3|10|0.3|0.01|22.53667|6
2.4|10|0.3|0.01|20.23143|7
2.5|10|0.3|0.01|12.67|5
3.1|10|0.5|0.1|20.19|6
3.2|10|0.5|0.1|20.705|4
3.3|10|0.5|0.1|18.69625|8
3.4|10|0.5|0.1|22.46333|6
3.5|10|0.5|0.1|20.64143|7
4.1|10|0.5|0.01|7.565|4
4.2|10|0.5|0.01|14.442|5
4.3|10|0.5|0.01|18.41|4
4.4|10|0.5|0.01|9.833333|6
4.5|10|0.5|0.01|11.72667|3
5.1|10|0.7|0.1|23.921|10
5.2|10|0.7|0.1|12.938|5
5.3|10|0.7|0.1|20.0375|4
5.4|10|0.7|0.1|18.285|2
5.5|10|0.7|0.1|18.174|5
6.1|10|0.7|0.01|9.915|4
6.2|10|0.7|0.01|11.08167|6
6.3|10|0.7|0.01|2.876667|3
6.4|10|0.7|0.01|17.26857|7
6.5|10|0.7|0.01|14.086|5
7.1|10|0|0.1|19.21|5
7.2|10|0|0.1|20.73875|8
7.3|10|0|0.1|22.5375|12
7.4|10|0|0.1|17.346|15
7.5|10|0|0.1|20|6
8.1|10|0|0.01|7.6925|4
8.2|10|0|0.01|10.8625|4
8.3|10|0|0.01|2|2
8.4|10|0|0.01|4.58|3
8.5|10|0|0.01|8.31|4
9.1|10|1|0.1|17.70833|6
9.2|10|1|0.1|23.722|5
9.3|10|1|0.1|19.15|6
9.4|10|1|0.1|24.48714|7
9.5|10|1|0.1|18.959|10
10.1|10|1|0.01|12.28333|6
10.2|10|1|0.01|11.2225|4
10.3|10|1|0.01|24.04833|6
10.4|10|1|0.01|15.3125|4
10.5|10|1|0.01|5.3325|4
## Conclusions:
Based on the simulation results, we can conclude that the algorithm effectively searched for the maximum of the given function every time. Due to the elements of randomness, this maximum was achieved at various stages (during different iterations), the maximum values found in each simulation differed from each other, but only slightly. Analyzing the results, it can be easily noticed that during subsequent iterations, the average adaptation of the population gradually increases and approaches the maximum value, which also proves the effectiveness of the algorithm we used.
