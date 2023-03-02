#
set term postscript enhanced color eps  "HelveticaBold" 30 
set key font ",28"
set key reverse
set key width -1.5
set key top right
set key box vertical width -3 height 0
#set rm 1
set pointsize 3. 
set mxtics 2 
set mytics 2 
set border lw 3. 
set out "time-kd.eps"


set tics scale 1.5 

set origin 0., 0.
set lmargin 10.0
set rmargin 0.5
set tmargin 0.5
set bmargin 3.1


x1=1e-4; y1=5e4;
x2=1e-4; y2=2.9e5;
set arrow from x1,y1 to x1,y2 filled nohead back lw 6 lt 2 lc rgb "dark-green"
#set arrow from x1,y1 to x1,y2 lw 3 lt 2  nohead
x3=0.9;y3=y1;
x4=x3; y4=2.3e5;
set arrow from x3,y3 to x4,y4 filled nohead back lw 6 lt 2 lc rgb "dark-green"
#set arrow from x3,y3 to x4,y4 lw 3 lt 2 nohead
set label "1D" at 3e-5, 2e5 tc rgb "dark-green"
set label "2D" at 1., 200000 tc rgb "dark-green"
set label "1D+2D" at 1e-2, 200000 tc rgb "dark-green"
#set label at 400, 25000 "1D" tc rgb "dark-green"


set xr [1e-5:4]
set yr [5e4:2.9e5]
set logscale x
set format x "10^{%L}"
set format y "%4.1t{/Symbol \264}10^{%L}"
set xlabel "Dissociation rate k_{d}" offset 0.0, 0.
set ylabel "Time" offset 1, 0
plot "./time-kd-koff.txt" i 0 w p pt 9 lt rgb "red" t "{/Symbol m}_2/{/Symbol m}_1=0.05",\
     "" i 1 w p pt 7 lt rgb "black" t "0.1",\
     "" i 2 w p pt 5 lt rgb "blue" t "0.2" ,\
     "" i 3 w l lt 1 lc rgb "red" lw 5 t "" ,\
     "" i 4 w l lt 1 lc rgb "black" lw 5 t "" ,\
     "" i 5 w l lt 1 lc rgb "blue" lw 5 t "" ,\
     "" i 6 w l lt 1 lc rgb "black" lw 5 t ""

