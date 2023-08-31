# Set terminal and output file
set terminal png
set output 'plot2.png'

# Set plot title and labels
set title 'Performance Data'
set xlabel 'Input'
set ylabel 'Time'

# Plot the data using columns 1, 2, 3, and 4 from the data file
plot 'output2.txt' using 1:2 with linespoints title 'Bubble', \
     '' using 1:3 with linespoints title 'Insertion', \
     '' using 1:4 with linespoints title 'Selection'

