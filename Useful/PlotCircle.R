gg_circle <- function(r, xc, yc, color="black", fill=NA, ...) {
  x <- xc + r*cos(seq(0, pi, length.out=100))
  ymax <- yc + r*sin(seq(0, pi, length.out=100))
  ymin <- yc + r*sin(seq(0, -pi, length.out=100))
  annotate("ribbon", x=x, ymin=ymin, ymax=ymax, color=color, fill=fill, ...)
}
square <- ggplot(data.frame(x=0:10, y=0:10), aes(x=x, y=y)) + theme_light()+
          scale_x_continuous(breaks=seq(0, 10, 1),minor_breaks = NULL) +
          scale_y_continuous(breaks=seq(0, 10, 1),minor_breaks = NULL)

square + gg_circle(r=4.5, xc=5, yc=5, alpha=0.1)

square + gg_circle(r=0.25, xc=0.5, yc=0.5, color="blue", fill="yellow", alpha=0.1)


