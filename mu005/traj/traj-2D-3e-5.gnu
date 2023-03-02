#
set term postscript enhanced color eps  "HelveticaBold" 28 
set key font ",27"
set size square
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
set out "2D-traj-kd3e-5.eps"
#set lmargin 0.1 
set xr [-52:52]
set yr [-52:52]
#unset logscale y
#set logscale x
#set ytics (8000, 9000, 10000, 11000, 12000, 13000)
#set format x "10^{%L}"
set xlabel "n_1" offset 0.0, 0.
set ylabel "n_2" offset 0, 0
plot "./eqFile.txt" u 2:3 w l lc 4 notitle

