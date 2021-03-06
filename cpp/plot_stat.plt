set term pngcairo size 1280,960 fontscale 2 linewidth 2

set bars 0.5
show bars
set pointsize 3

set xlabel "r/M"
set key right top
set xrange [-1:2**32]
set ylabel "-alpha"

set logscale x
set logscale y

set output "data_stat_1807.png"
plot "data_stat_1807.txt" u 1:(-($2)):(abs($3)) w yerrorbars title "static" pt 1 lt rgb "black",\
	(1/sqrt(1-2/x)-1) title "tolman" lt rgb "black"
	
#################################################################
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set bars 0.5
show bars
set pointsize 3

set xlabel "r/M"
set key right top
set xrange [170:2**32]
set ylabel "-alpha-tolman"

set logscale x

set output "data_stat_1807_tolman.png"
plot "data_stat_1807.txt" u 1:(-($2)-(1/sqrt(1-2/($1))-1)):(abs($3)) w yerrorbars title "static" pt 1 lt rgb "black"

