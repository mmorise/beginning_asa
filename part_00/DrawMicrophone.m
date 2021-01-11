function DrawMicrophone(x, y, rx, ry)

t = 0 : 0.01 : 2 * pi;
plot(rx * sin(t) + x, ry * cos(t) + y, 'k');
hold on;
plot([x + rx, x + rx], [y - (ry * 1.2) y + (ry * 1.2)], 'k');
plot([x - 1, x - rx], [y, y], 'k')
hold off;
