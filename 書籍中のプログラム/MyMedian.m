function median_value=MyMedian(x)
y=sort(x);
c=(length(x)+1)/2;
median_value=(y(floor(c))+y(ceil(c)))/2;
