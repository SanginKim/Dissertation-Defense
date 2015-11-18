rm(list=ls())
library(ggplot2)
library(grid)
######################################
#
# Figure 1.2. ENTA
#
#
# (1) ggplot2 
#
#
#####################################


# (1)

x = 0:5
y= -2:3
d <- data.frame(x=x,y=y)


g <- ggplot(d, aes(x,y)) +geom_blank() +geom_segment(aes(x=0, xend=5, y=0, yend=0), size=2)+
annotate("segment", x=0:5, xend=0:5, y=0.1, yend=-0.1)+
annotate("text", x=0, y=-0.4, label="0", size=10)+
geom_segment(aes(x=0.05, xend=0, y=1, yend=0.2), arrow=arrow(length=unit(0.3, "cm")),size=1.2)+
annotate("text", x=0.05, y=1.2, label=as.character(expression(H[0])), size=9, parse=TRUE) 

g2 <- g +geom_segment(aes(x=0.05, xend=5, y=0.3, yend=0.3), size=1.5, col="red")+
 annotate("segment", x=c(0.05, 5), xend=c(0.01, 5), y=0.3, yend=0, size=1.2,col="red")+
 annotate("text",x=3,y=2, label="Rejection region", size=14, col="red")+
geom_segment(aes(x=3, xend=3, y=1.5, yend=0.4), arrow=arrow(length=unit(0.5, "cm")),size=2, col="red")

g2 +theme(axis.line=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(),
		axis.title=element_blank(), panel.background=element_blank(),
		panel.border=element_blank(), panel.grid.major=element_blank(), panel.grid.minor=element_blank())	 


