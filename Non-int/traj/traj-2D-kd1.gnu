#
set term postscript enhanced color eps  "HelveticaBold" 30 
set key font ",28"
set size square 0.9, 1.1
#term size 600, 600
#set size 1, 1
set key reverse
set key width 1.5
set key top left
#set key box vertical width -2.5 height 1
set pointsize 3. 
set mxtics 1 
set mytics 1 
set border lw 3. 
set out "2D-traj-kd1.eps"

set origin 0., 0.
set lmargin 6.0
set rmargin 0.1
set tmargin 0.5
set bmargin 3.5

set xr [-51:51]
set yr [-51:51]
#unset logscale y
#set logscale x
#set ytics (8000, 9000, 10000, 11000, 12000, 13000)
#set format x "10^{%L}"
set xlabel "n_1" offset 0.0, 0.
set ylabel "n_2" offset 0, 0
plot "./eqFile.txt" u 2:3 w l lw 4 lc 1 notitle

