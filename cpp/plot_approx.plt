set term pngcairo size 1280,960 fontscale 2 linewidth 2


set xlabel "r/M"
set key right top
set xrange [0:500]
set yrange [0:1.5]
set ylabel "r_*^2/r^2*f(r)"

set arrow from 100, graph 0 to 100, graph 1 nohead

set output "img_approx.png"
plot ((1+2*log(x/2-1)/x)**2*(1-2/x)) notitle lt rgb "black",\
	1.1 notitle lt rgb "black"

print log(10)