function win=MyBlackman(N)
n=(0:N-1)';
win=0.42-0.5*cos(2*pi*n/(N-1))+0.08*cos(4*pi*n/(N-1));