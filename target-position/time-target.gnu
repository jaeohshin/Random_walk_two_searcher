#
set term postscript enhanced color eps  "HelveticaBold" 30
set key font ",28"
set key reverse
set key width 1.
set key top right
set key box vertical width -1 height 1
#set rm 1
set pointsize 3. 
#set mxtics 2 
#set mytics 2 
set border lw 3. 

set out "fig-m.eps"
lww=3.0;
#set key bottom left 
set key top left 

#set key spacing 1.0 
#set line width 15 
#set my2tics 1 

set origin 0.,0. 
set tmargin 0.5
set bmargin 3.0
set rmargin 1.2
set lmargin 11 
#set label at 20, 60 "L=1001, u=1e5"
#set label at 5, 50 "t^{2}"
#set logscale xy
#set xr [0.:0.505]
set yr [1.8e4:1.5e5]
#set yr [1:15]
#set yr [1:15]
#set xtics 5000:
#set ytics 1
##set title ""
#set format xy "10^{%L}"
set xlabel "Target position, m_0" offset 0.0, 0.2
set ylabel "Time, T" offset 1., 0.0
#set grid
uu=10**5;LL=1001;
#Below x is lambda
lww=3.
pss=3.5
tmin=1;
mu2=0.025
L=100;

T(x)=(2*L+L**2+12*x**2)/(6*2*mu2)

set format y "%4.1t{/Symbol \264}10^{%L}"
LL=1
plot "./time-m.txt" i 0 u ($1/LL):($2/tmin) w p pt 7 ps pss lw 2. t "k_{d}=10^{-4}",\
     "" i 1 u ($1/LL):($2/tmin) w p pt 5 lc 3 ps pss lw 2. t "10^{-2}",\
     "" i 2 u ($1/LL):($2/tmin) w p pt 9 lc 7 ps pss lw 2. t "1",\
    T(x) w l lt 1 lw 4 lc rgb "red"
