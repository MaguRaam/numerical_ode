#!/bin/bash
pdflatex --interaction=batchmode doc.tex
rm *.log *.aux
open doc.pdf
