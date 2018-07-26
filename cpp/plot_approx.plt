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
	
#######################################	
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2
set samples 1000 

set xlabel "r/M"
set key right top
set xrange [200:2**20]

set ylabel "-alpha"

set logscale x

set arrow from 200, graph 0 to 200, graph 1 nohead lt rgb "black" dt '-'

delta(x)=x/2-1 

set output "img_paper.png"
plot 1/sqrt(1-2/x)-1 lt rgb "black",\
	sqrt((1+delta(x))/(delta(x)-1))-1 title "cooles paper" lt rgb "red",\
	(1+2/x)*(1+sqrt(2/x))-1 title "deeg" lt rgb "blue"

set logscale y

#set yrange [-5:5]
set output "img_paper_detail.png"	
plot ((sqrt((1+delta(x))/(delta(x)-1))-1)-1/sqrt(1-2/x)+1) title "cooles paper" lt rgb "red",\
	(1+2/x)*(1+sqrt(2/x))-1/sqrt(1-2/x) title "deeg" lt rgb "blue",\
	((1+2*log(x/2-1)/x)**2*(1-2/x))*(1/sqrt(1-2/(x))-1) title "Approximation" lt rgb "black" dt '-.-'