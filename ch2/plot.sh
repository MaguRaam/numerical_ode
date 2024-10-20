#!/bin/bash
gnuplot plot.gp
pdflatex --interaction=batchmode figure.tex
rm *.aux *.log *-inc.eps *.tex *converted-to.pdf
open figure.pdf
