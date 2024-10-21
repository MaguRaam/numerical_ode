set terminal epslatex standalone size 10cm,8cm color colortext 12
set output 'figure.tex'

# Scale tick size
set xtics scale 2.0  
set ytics scale 2.0  

# Set xlabel
set xlabel '$t$'

# Style settings for lines
set style line 1 lc rgb '#1f77b4' lt 1 lw 8  # Thick Blue for analytical  
set style line 2 lc rgb '#ff7f0e' lt 2 dashtype 2 lw 8  # Dashed Orange for numerical

# Plot the data
plot 'output.dat' using 1:3 with lines ls 1 title "$Y(t)$", \
     'output.dat' using 1:2 with lines ls 2 title "$yh(t)$"
