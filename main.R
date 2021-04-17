epoch = 0
sign<-matrix();
phenotype<-matrix();
f<-matrix();
finalSign <- matrix()
finalPhenotype <- matrix()
sumMeasures <- vector();
notBest = 0;
bestSumMeasures = 0;
withoutImprovement = 3;
bestSolution<- matrix(1, nrow = 1, ncol = 4)
adaptionFunction <- function(X) {
    return(0.2 * X^3 + 0.1 * X^2 - 8*X)
}
pop<-matrix(round(runif(40,0,1)),10,4)
while (epoch < 15) {
    if (epoch > 0) {
        pop<-mutation
    }
    epoch = epoch + 1
    for(i in 1:10) {
        sign[i]<-pop[i,1]*-1;
        if (sign[i] == -1) {
            phenotype[i]<- (2^2*pop[i,2] + 2^1*pop[i,3] + 2^0*pop[i,4]) * sign[i];
        } else {
            phenotype[i]<- (2^2*pop[i,2] + 2^1*pop[i,3] + 2^0*pop[i,4]);
        }
    }
    valueAdaptionFunction <- vector(length=10)
    valueAdaptionFunction <- adaptionFunction(phenotype)
    maximum <- max(valueAdaptionFunction)
    measureAdaptation <- vector(length=10)
    measureAdaptation <- maximum - valueAdaptionFunction
    sumMeasures <- sum(measureAdaptation)

    rouletteWheel <- vector(length=10) + 0
    for(i in 1:10) {
        for(j in 1:i) {
            rouletteWheel[i] <- rouletteWheel[i] + measureAdaptation[j]
        }
    }
    draw <- runif(10, 0, sumMeasures)
    descendants <- vector(length=10)
    for(i in 1:10) {
        for(j in 1:10) {
            if(draw[i] <= rouletteWheel[j]){
                descendants[i] <- j
                break
            }
        }
    }
    descendantsBinary <- matrix(nrow = 10, ncol = 4)
    for(i in 1:10) {
        descendantsBinary[i, 1:4] <- pop[descendants[i], 1:4]
    }
    chanceCrossing <- 1
    crossing <- descendantsBinary
    for(i in seq(from = 1, to = 10, by = 2)) {
        if(runif(1,0.0,1.0) <= chanceCrossing) {
            crossing[i, 1:2] <- descendantsBinary[i, 1:2]
        }
        if(runif(1,0.0,1.0) <= chanceCrossing) {
            crossing[i, 3:4] <- descendantsBinary[i+1, 3:4]
        }
        if(runif(1,0.0,1.0) <= chanceCrossing) {
            crossing[i+1, 1:2] <- descendantsBinary[i+1, 1:2]
        }
        if(runif(1,0.0,1.0) <= chanceCrossing)  {
            crossing[i+1, 3:4] <- descendantsBinary[i, 3:4]
        }
    }
    mutation <- crossing
    chanceMutation <- 0.1
    for (i in 1:10) {
        for(j in 1:4) {
            if(runif(1,0.0,1.0) <= chanceMutation) {
                mutation[i,j] <- (mutation[i,j] +1) %% 2
            }
        }
    }
    for(i in 1:10) {
        finalSign[i]<-mutation[i,1]*-1;
        if (finalSign[i] == -1) {
            finalPhenotype[i]<- (2^2*mutation[i,2] + 2^1*mutation[i,3] + 2^0*mutation[i,4]) * finalSign[i];
        } else {
            finalPhenotype[i]<- (2^2*mutation[i,2] + 2^1*mutation[i,3] + 2^0*mutation[i,4]);
        }
    }
    finalValueAdaptionFunction <- vector(length=10)
    finalValueAdaptionFunction <- adaptionFunction(finalPhenotype)
    finalMaximum <- max(finalValueAdaptionFunction)
    finalMeasureAdaptation <- vector(length=10)
    finalMeasureAdaptation <- finalMaximum - finalValueAdaptionFunction
    finalSumMeasures <- sum(finalMeasureAdaptation)
    sumMeasures <- append(sumMeasures, finalSumMeasures)
    if (finalSumMeasures > bestSumMeasures) {
        bestSumMeasures = finalSumMeasures
        notBest = 0
    } else {
        notBest = notBest + 1
    }
    if (notBest == withoutImprovement) {
        cat("There is no improvement by ", notBest, "populations.")
        break
    }
    if (all(mutation[1, 1:4] == bestSolution) &&
        all(mutation[2, 1:4] == bestSolution) &&
        all(mutation[3, 1:4] == bestSolution) &&
        all(mutation[4, 1:4] == bestSolution) &&
        all(mutation[5, 1:4] == bestSolution) &&
        all(mutation[6, 1:4] == bestSolution) &&
        all(mutation[7, 1:4] == bestSolution) &&
        all(mutation[8, 1:4] == bestSolution) &&
        all(mutation[9, 1:4] == bestSolution) &&
        all(mutation[10, 1:4] == bestSolution)) {

        print("Found best solution.")
        break
    }
    if (all(mutation[2, 1:4] == mutation[1, 1:4]) &&
        all(mutation[3, 1:4] == mutation[1, 1:4]) &&
        all(mutation[4, 1:4] == mutation[1, 1:4]) &&
        all(mutation[5, 1:4] == mutation[1, 1:4]) &&
        all(mutation[6, 1:4] == mutation[1, 1:4]) &&
        all(mutation[7, 1:4] == mutation[1, 1:4]) &&
        all(mutation[8, 1:4] == mutation[1, 1:4]) &&
        all(mutation[9, 1:4] == mutation[1, 1:4]) &&
        all(mutation[10, 1:4] == mutation[1, 1:4])){
        print("Population is composed of the same chromosome.")
        break
    }
}
averageValueAdaptation<-(sum(sumMeasures)/(epoch*10))
print("Population:")
show(pop);
print("Crossing")
show(crossing);
print("Mutation")
show(mutation);
print("Average value adaption:")
show(averageValueAdaptation);
print("Epoch")
show(epoch);