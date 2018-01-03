

model <- read.csv("2018 House Model v4.csv", TRUE, ",")

numseats <- 0

listoutcomes <- c(1:1000)
outcomes[1]
k <- 1
for (j in 1:1000){
for(i in 1:435) {
  outcomes <- c(sample(1:999, 435, replace = T))
  if (outcomes[i] < model$WIN.PROB..DEM.[i]*10 ){
    numseats <- numseats + 1
  }
  
}
  listoutcomes[k] <- numseats
  numseats <- 0
  k <- k + 1
}
paste("Dems won ", numseats," seats")
listoutcomes
mean(listoutcomes)
hist(listoutcomes, main="Dem Seats won", ylab="freq", xlab = "Dem seats won", breaks = c(200:260))
