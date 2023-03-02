#
set term postscript enhanced color eps  "HelveticaBold" 30 
set key font ",28"
set key reverse
set key width 1.
set key top left
set key box vertical width -1. height 0.5
set pointsize 3. 
set mxtics 10 
set mytics 10 
set border lw 3. 
set out "plot-time-L-exp.eps"


set tics scale 1.5 
set bmargin
set tmargin 0.5
set rmargin 1
set lmargin

set xr [20:3000]
#set yr [1:60]
set logscale xy
set format x "10^{%L}"
set xlabel "Lattice size, L" offset 0.0, 0.
set ylabel "Time/(L^{2}log(L))" offset 0.5, 0
ltt=2.5
e=2.71828182846;
ff(x)=e**(x);
plot "./time-L.txt" i 1 u 1:(($2)*($1)**(-2)/(log($1))) w p pt 7 ps 3.5 t "k_{off}=0.5"


