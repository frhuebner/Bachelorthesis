reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set bars 0.5
show bars
set pointsize 3
set samples 1000

radius(x)=(-3.0/2*sqrt(2.0)*(x-4.0/3))**(2.0/3)

set xlabel "{/*1.5 r/M}"
set key right top
set ylabel "{/Symbol D}{/*1.5 T/T_H}"

set format x "10^{%T}"
set format y "10^{%T}"
set tics font ", 12"

set logscale x
set logscale y

set arrow from 200, graph 0 to 200, graph 1 nohead lt rgb "black" dt '-'

set xrange [1:2**32]
set output "final/stat.png"
plot "data_stat_1807.txt" u 1:(-($2)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	(1/sqrt(1-2/x)-1) title "Tolman" lt rgb "black"

set xrange [1:2e5]
set yrange [1e-6:2]
set output "final/circ.png"
plot "data_circ_1907.txt" u 1:(-($2)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	(1/sqrt(1-2/x)-1) title "Tolman" lt rgb "black"

set xrange [1:1e5]
set yrange [1e-6:2]
set output "final/rad.png"
plot "data_rad_2007.txt" u (radius(($1))):(-($2)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	(1/sqrt(1-2/x)-1) title "Tolman" lt rgb "black"	

set xrange [1:2**32]
set output "final/stat_all.png"
plot "data_stat_1807.txt" u 1:(-($2)):(abs($3)) w yerrorbars title "Static" pt 1 lt rgb "black",\
	"data_circ_1907.txt" u 1:(-($2)):(abs($3)) w yerrorbars title "Circular" pt 1 lt rgb "black",\
	"data_rad_2007.txt" u (radius(($1))):(-($2)):(abs($3)) w yerrorbars title "Radial" pt 1 lt rgb "black",\
	(1/sqrt(1-2/x)-1) title "Tolman" lt rgb "black",\
	((1+2*log(x/2-1)/x)**2*(1-2/x))*(1/sqrt(1-2/(x))-1) title "Approximation" lt rgb "black" dt '-.-'
	
##############################################################
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set bars 0.5
show bars
set pointsize 3

set xlabel "{/*1.5 r/M}"
set key right top
set xrange [140:2**32]
set ylabel "{/Symbol D} {/*1.5 T/T_H - 1/√f(r)}"


set format x "10^{%T}"
#set format y "%.0t×10^{%T}"

set tics font ", 12"

set logscale x

set arrow from 200, graph 0 to 200, graph 1 nohead lt rgb "black" dt '-'

#set title "Static Observer - Difference to Tolman relation"
set xrange [140:2**32]
set ytics 2e-5
set output "final/stat_tolman.png"
plot "data_stat_1807.txt" u 1:(-($2)-(1/sqrt(1-2/($1))-1)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	0 title "Tolman" lt rgb "black"
	
set xrange [140:2e5]
set ytics 2e-4
set output "final/circ_tolman.png"
plot "data_circ_1907.txt" u 1:(-($2)-(1/sqrt(1-2/($1))-1)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	0 title "Tolman" lt rgb "black"
	
set xrange [140:1e5]
set ytics 2e-3
set yrange [-0.001:0.008]
set output "final/rad_tolman.png"
plot "data_rad_2007.txt" u (radius(($1))):(-($2)-(1/sqrt(1-2/($1))-1)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	0 title "Tolman" lt rgb "black"
	
set xrange [140:1e5]
set ytics 2e-3
set yrange [-0.001:0.008]
set output "final/rad_tolman_error.png"
plot "data_rad_2007.txt" u (radius(($1))):(-($2)-(1/sqrt(1-2/($1))-1)):(abs($3)) w yerrorbars title "Observer" pt 1 lt rgb "black",\
	0 title "Tolman" lt rgb "black",\
	((1+2*log(x/2-1)/x)**2*(1-2/x))*(1/sqrt(1-2/(x))-1) title "Approximation" lt rgb "black" dt '-.-'
