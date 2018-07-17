set term pngcairo size 1280,960 fontscale 2 linewidth 2

set xlabel "-tau"
set key right top
set xrange [-1:200]
set ylabel "alpha"

#set logscale y

set output "data_rad_test.png"
plot "data_rad_test2.txt" u (((($0)*10))**(2./3)):(-$1) title "radial"

###########################
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set xlabel "-tau"
set key right top
set xrange [-1:2**30]
set ylabel "-alpha"

set logscale x
set logscale y

set output "data_rad_1707.png"
plot "data_rad_1707.txt" u (-($1)):(-$2):(abs($3)) w yerrorbars title "radial"

###########################
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set xlabel "-tau"
set key right top
set xrange [-1:2**30]
set ylabel "-alpha"

set logscale x
set logscale y

radius(x)=(-3/2*sqrt(2)*(x-4/3))**(2.0/3)

set output "data_rad_1707_2.png"
plot "data_rad_1707_2.txt" u (-($1)):(-$2):(abs($3)) w yerrorbars title "radial",\
	(1/sqrt(1-2/radius(-x))-1) title "tolman" lt rgb "black",\
	(1/(1-2/radius(-x))-1) title "tolman" lt rgb "red"

###########################
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set xlabel "r"
set key right top
set xrange [-1:2**30]
set ylabel "-alpha"

set logscale x
set logscale y

radius(x)=(-3/2*sqrt(2)*(x-4/3))**(2.0/3)
print radius(-100)

set output "data_rad_1707_2_radius.png"
plot (1/sqrt(1-2/radius(-x))-1) title "tolman" lt rgb "black"

#"data_rad_1707_2.txt" u (-($1)):(-$2):(abs($3)) w yerrorbars title "radial",\	
	
###########################
reset
set term pngcairo size 1280,960 fontscale 2 linewidth 2

set xlabel "-tau"
set key right top
set xrange [-1:2**30]
set ylabel "-alpha"

set logscale x
set logscale y

set output "data_rad_1707_diff.png"
plot "data_rad_1707.txt" u (-($1)):(-$2):(abs($3)) w yerrorbars title "radial",\
	"data_rad_1707_2.txt" u (-($1))+1:(-$2):(abs($3)) w yerrorbars title "radial 2"