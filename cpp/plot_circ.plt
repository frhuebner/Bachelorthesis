set term pngcairo size 1280,960 fontscale 2 linewidth 2


set xlabel "r/M"
set key right top
set xrange [3:100]
set ylabel "log(alpha)"

set logscale y

set output "data_circ_test.png"
plot "data_circ_test.txt" u 1:2 title "c++",\
	"data_circ_test.txt" u 1:3 title "mathematica",\
	-sqrt(abs(1-2/x))+1 title "tolman" lt rgb "black"

