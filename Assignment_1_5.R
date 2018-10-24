#Assignment 1.5 Session-1

#Problem
#1. Create an m x n matrix with replicate(m, rnorm(n)) with m=10 column vectors of n=10 elements each,
#constructed with rnorm(n), which creates random normal numbers.
#Then we transform it into a dataframe (thus 10 observations of 10 variables) and perform an algebraic
#operation on each element using a nested for loop: at each iteration, every element referred by the two
#indexes is incremented by a sinusoidal function, compare the vectorized and non-vectorized form of creating
#the solution and report the system time differences.

#Solution 1

#Vectorized form
set.seed(100)

#create matrix
mat_1<- replicate(10,rnorm(10))

#transform into data frame
df_1 <- data.frame(mat_1)
#Apply sinusodial function
df_1 <- df_1 + 100*sin(pi - 0.60)

#non-vectorized form
set.seed(100)
#create matrix
mat_1<- replicate(10,rnorm(10))
#transform into data frame
df_1= data.frame(mat_1)

for(i in 1:10){
  for(j in 1:10){
    df_1[i,j]<- df_1[i,j] + 100*sin(pi - 0.60)
    print(df_1)
  }
}

#time difference

system.time(
  df_1 <- df_1 + 100*sin(pi - 0.60)
)

system.time(
  for(i in 1:10){
    for(j in 1:10){
      df_1[i,j]<- df_1[i,j] + 100*sin(pi - 0.60)
    }
  }
)

#non-vectorized form take more time.