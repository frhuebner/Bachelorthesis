set term pngcairo size 1280,960 fontscale 2 linewidth 2


set xlabel "r/M"
set key right top
set xrange [1:2**20]
set ylabel "-alpha"

set logscale x
set logscale y

set output "data_circ_1907.png"
plot "data_circ_1907.txt" u 1:(-($2)):(abs($3)) w yerrorbars title "circular" pt 1 lt rgb "black",\
	-(sqrt(1-2/x)-1) title "tolman" lt rgb "black"
	
#####################################

reset

set term pngcairo size 1280,960 fontscale 2 linewidth 2

set xlabel "r/M"
set key right top
set xrange [1:2**20]
set ylabel "-alpha-tolman"

set logscale x

set output "data_circ_1907_tolman.png"
plot "data_circ_1907.txt" u 1:(-(-($2)+(sqrt(1-2/($1))-1))):(abs($3)) w yerrorbars title "circular - tolman" pt 1 lt rgb "black"
	
