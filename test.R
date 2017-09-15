df <- read.csv("Metadata.csv")

# which variables?
str(df)

# Start plotting
library("ggplot2")

# Make first plot
ggplot(data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle))+
  geom_point(shape = 21)

df$Reactor.cycle <- factor(df$Reactor.cycle)

ggplot(data = df, aes(x = Timepoint, y = temp, fill = Reactor.cycle))+
  geom_point(shape = 21, size = 4)

# Store ggplot object 
p1 <- ggplot(data = df, aes(x = Timepoint, y = temp, fill = Reactor.phase))
p2 <- p1 + geom_point(shape = 21, size = 4, alpha = 0.5) + theme_bw()+
  geom_line()

# Lets facet this
p3 <- p2 + facet_grid(~Reactor.cycle)

# To plot: type p3
p3

# How do I know
# what's inside reactor phase
df$Reactor.phase
levels(df$Reactor.phase)

p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)

# Alternative way
p4 + geom_line(aes(color = Reactor.phase))

# Challenge time
### Right side: Conductivity
### Middle: Diversity D0
### Left: Cell density

