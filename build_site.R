#Set our working directory. 
#This helps avoid confusion if our working directory is 
#not our site because of other projects we were 
#working on at the time. 
setwd("/Users/gai7612/Documents/GitHub/gol-like-soccer-goal.github.io")

#render your sweet site. 
rmarkdown::render_site()
