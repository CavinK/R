## https://www.youtube.com/watch?v=Qe1NvHJcmZs

library(devtools)
devtools::install_github("Bart6114/simmer")
install.packages("simmer",dependencies = T)
library(simmer)

mean(rnorm(sample(x=seq(100,1000),size = 100),15,3))

library(magrittr) # the same as the above code, but much easier
sample(x=seq(100,1000),size=100) %>%
rnorm(mean=15,sd=3) %>%
mean()  

library(simmer)
env <- simmer("outpatient clinic")
env

patient <- trajectory("patients' path") %>%
  seize("nurse",1) %>%     ## Assessment of Nurses' Activities
  timeout(function() rnorm(1,15)) %>%   # one nurse for 15 minutes?
  release("nurse",1) %>%
  
  seize("doctor",1) %>%    ## Doctors'
  timeout(function() rnorm(1,20)) %>%
  release("doctor",1) %>%
  
  seize("administration",1) %>%   ## Admin Staffs'
  timeout(function() rnorm(1,5)) %>%
  release("administration",1)

## To find out the optimum of the resource allocation by changing parameters
## (ex. ("nurse",2) => ("nurse",3))

env %>%
  
  add_resource("nurse",2) %>%   ## two nurses added <- queue status: 36 (the bottle neck!)
  add_resource("doctor",3) %>%   ## three docs
  add_resource("administration",2) %>%   ## two admin staffs
  add_generator("patient", patient, function() rnorm(1,5,0.5))   ## Arrival times of patients are normally distributed with the mean of 5 minutes

env %>% run(until=540)

install.packages("simmer.plot")
library(simmer.plot)

plot(env,what = "resources",metric="usage",c("nurse","doctor","administration"),items = c("server","queue"))   # Resource usage 
plot(env,what="arrivals",metric="waiting_time")   # Waiting time evolution 

# When you check out the graph of resource usage, you can find the "queue" lines become stable if you add the number of nurses and docs to 3 and 4 each.
# Conclusion: Hiring one more nursing staff and one more doctor is the optimal solution! 