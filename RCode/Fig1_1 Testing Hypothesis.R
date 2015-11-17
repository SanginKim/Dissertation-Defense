rm(list=ls())
library(ggplot2)
library(grid)
######################################
#
# Figure 1.1. Null hypothesis testing
#
#
# (1) ggplot2 version
#
# (2) classic R plot

#####################################


# (1)
g <- ggplot(data.frame(X=c(-5,5)), aes=(X)) +stat_function(fun=dnorm, size=2)+
  scale_x_continuous(limits=c(-5,5), breaks=seq(-4,4,by=2)) +
  scale_y_continuous(expand=c(0,0),limits=c(0,0.45), breaks=seq(0,0.4,by=0.2))+
  labs(title=expression(paste("Testing ", 
                              bgroup( "{",atop(H[0]: mu == 0, H[1]: mu > 1),"}"),
                              "  with standard normal variables ", (alpha == 0.05)
                          )),
       x="Standard Normal Random Variable", 
       y="Density") +
  theme(plot.title=element_text(size=26), axis.title=element_text(size=23),
        axis.text=element_text(size=18))

g2 <- g+  annotate("text",x=0,y=0.15, label="95%",size=12)+
  annotate("text",x=3,y=0.35, label="Rejection region", size=14, col="darkred")+
  annotate("text",x=2.1,y=0.02, label="5%",size=12, col="red")+
  annotate("segment", x=qnorm(0.95), xend=qnorm(0.95), y=0, yend=dnorm(qnorm(0.95)), linetype="dashed",size=1.5)+
  geom_segment(aes(x=3.3,xend=2.3, y=0.32, yend=0.05), 
               arrow=arrow(length=unit(0.5,"cm")), size=3, col="darkred")
  
  xv=seq(qnorm(0.95), 4, by=0.1)
  yv=dnorm(xv)
  sh <- data.frame(xv,yv)

g2 + geom_ribbon(data=sh, aes(x=xv,ymin=0,ymax=yv), alpha=0.3, fill="yellow") 


# (2)
xp <- seq(-5,5, length=200)
yp <- dnorm(xp)
plot(xp, yp, yaxs="i",ylim=c(0,0.5), xlim=c(-5,5), type = "l", ylab="Density", xlab="Random variable, X")
#abline(v=0)
title("Testing H0:M=0 & H1:M>0 when X ~ N(0,1), a=0.05")  
qnorm(0.95)
segments(1.64,0,1.64,0.103, lty=2)
dnorm(1.64)
text(2.9, 0.36,"rejection region", cex=1.4)
arrows(3,0.33,2.2,0.05)
text(-0.1, 0.2, "95%", cex=1.1)
text(2,0.025,"5%", cex=1.1)

