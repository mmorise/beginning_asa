function win=MyHamming(N)
n=(0:N-1)';
win=0.54-0.46*cos(2*pi*n/(N-1));
