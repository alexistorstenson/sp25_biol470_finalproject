library(dplyr)
library(ggplot2)
library(patchwork)

dat <- read.csv("./data/2020csv.txt", header = TRUE)
dat <- apply(dat, 2, function(x) ifelse(x == 99 | x == 999, NA, x))
summary(dat)

northness <- cos(dat["WDIR"])
eastness <- sin(dat["WDIR"])

plot1 <- ggplot(dat, aes(ATMP,DEWP)) + geom_point(col='deeppink2',size=1) +
  geom_smooth(method='lm',col='blue4')
plot1 + labs(title="Air Temperature vs. Dewpoint Temperature, 2020, Folly Beach, SC",
             x="Air Temperature (C)",y="Dewpoint Temperature (C)")

plot2 <- ggplot(dat, aes(DEWP,WDIR)) + geom_point(col='aquamarine2',size=1) +
  geom_smooth(method='lm',col='brown3')
plot2 + labs(title="Dewpoint Temperature vs. Wind Direction, 2020, Folly Beach, SC",
             y="Wind Direction (deg)",x='Dewpoint Temperature (C)')


dat2 <- read.csv("./data/2019csv.txt", header = TRUE)
dat2 <- apply(dat2, 2, function(x) ifelse(x == 99 | x == 999, NA, x))

summary(dat2)
plot3 <- ggplot(dat2, aes(ATMP,DEWP)) + geom_point(col='deeppink2',size=1) +
  geom_smooth(method='lm',col='blue4')
plot3 + labs(title="Air Temperature vs. Dewpoint Temperature, 2019, Folly Beach, SC",
             x="Air Temperature (C)",y="Dewpoint Temperature (C)")

plot4 <- ggplot(dat2, aes(DEWP,WDIR)) + geom_point(col='aquamarine2',size=1) +
  geom_smooth(method='lm',col='brown3')
plot4 + labs(title="Dewpoint Temperature vs. Wind Direction, 2020, Folly Beach, SC",
             y="Wind Direction (deg)",x='Dewpoint Temperature (C)')


dat <- read.csv("./data/2018csv.txt", header = TRUE)
dat <- apply(dat, 2, function(x) ifelse(x == 99 | x == 999, NA, x))

summary(dat)
plot5 <- ggplot(dat, aes(ATMP,DEWP)) + geom_point(col='deeppink2',size=1) +
  geom_smooth(method='lm',col='blue4')
plot5 + labs(title="Air Temperature vs. Dewpoint Temperature, 2018, Folly Beach, SC",
             x="Air Temperature (C)",y="Dewpoint Temperature (C)")

plot6 <- ggplot(dat, aes(DEWP,WDIR)) + geom_point(col='aquamarine2',size=1) +
  geom_smooth(method='lm',col='brown3')
plot6 + labs(title="Dewpoint Temperature vs. Wind Direction, 2020, Folly Beach, SC",
             y="Wind Direction (deg)",x='Dewpoint Temperature (C)')

plot3 + plot1

