reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set bars 0.5
show bars
set pointsize 3
set samples 1000

set key font ",20"

set xrange [0:5]
set yrange [0:0.2]
set ytics 0.1
set tics font ", 20"
set ylabel "{/*1.5 Excitation rate}"
set xlabel "{/*1.5 Energy E}"

set output "thermal_fit.png"
plot x/(exp(x)-1)/6.28-exp(-x/3)*sin(exp(x/30)*100+2)/60 title "{observed}" lw 2 lt rgb "black",\
	x/(exp(x)-1)/6.28 title "{thermal part}" lw 2 lt rgb "red"