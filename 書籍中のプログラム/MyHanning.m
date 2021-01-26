function win=MyHanning(N)
n=(1:N)';
win=(1-cos(2*pi*n/(N+1)))/2;