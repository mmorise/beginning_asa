function yi=MyInterp1(x,y,xi)
delta_x=x(2)-x(1);
xi=max(x(1),min(x(end),xi));
xi_base=floor((xi-x(1))/delta_x);
xi_fraction=(xi-x(1))/delta_x-xi_base;
delta_y=[diff(y);0];
yi=y(xi_base+1)+delta_y(xi_base+1).*xi_fraction;