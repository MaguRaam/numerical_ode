set terminal pdfcairo enhanced size 10cm,8cm
set output 'plot.pdf'

# Style settings for lines
set style line 1 lt 1 lw 2 lc rgb "blue"  # Analytical: solid blue line, thick
set style line 2 lt 2 lw 2 dt 2 lc rgb "red"   # Numerical: dashed red line

# Plot the data
plot 'output.dat' using 1:3 with lines ls 1 title "Y(t)", \
     'output.dat' using 1:2 with lines ls 2 title "yh(t)"
