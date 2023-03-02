#
set term postscript enhanced color eps  "HelveticaBold" 30 
set key font ",28"
set key reverse
set key width 1.
set key top left
set key box vertical width -1.5 height 1
set pointsize 3. 
set mxtics 10 
set mytics 10 
set border lw 3. 
set out "plot-time-L.eps"


set tics scale 1.5 
set bmargin
set tmargin 0.5
set rmargin 1
set lmargin

set xr [10:3000]
set yr [2e2:3e8]
set logscale 
set format xy "10^{%L}"
set xlabel "Lattice size, L" offset 0.0, 0.
set ylabel "Time" offset -0.5, 0
ltt=2.5
plot "./timeFile-eb.txt" u 1:2:3 w errorbar  pt 4 t "k_{off}=0.5"


