set term pngcairo size 1280,960 fontscale 2 linewidth 2
set samples 1000 

set xlabel "r/M"
set key right top
set xrange [0:500]
set yrange [0:1.5]
set ylabel "r_*^2/r^2 f(r)"

set arrow from 200, graph 0 to 200, graph 1 nohead lt rgb "black" dt '-'

set output "img_approx.png"
plot ((1+2*log(x/2-1)/x)**2*(1-2/x)) notitle lt rgb "black",\
	((1+2*log(200/2-1)/200)**2*(1-2.0/200)) notitle lt rgb "black" dt '-'

#######################################	

set term pngcairo size 1280,960 fontscale 2 linewidth 2
set samples 1000 

set xlabel "r/M"
set key right top
set xrange [0:2**20]
set yrange [0:1.5]
set ylabel "r_*^2/r^2 f(r)"

set logscale x

set arrow from 200, graph 0 to 200, graph 1 nohead lt rgb "black" dt '-'

set output "img_approx_log.png"
plot ((1+2*log(x/2-1)/x)**2*(1-2/x)) notitle lt rgb "black",\
	((1+2*log(200/2-1)/200)**2*(1-2.0/200)) notitle lt rgb "black" dt '-'	