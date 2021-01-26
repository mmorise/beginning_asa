function DrawSinewave(h, theta)

set(h, 'Color', [1 1 1]);
set(h, 'Position', [100 100 950 400]);
h1 = subplot(1, 2, 1);
h2 = subplot(1, 2, 2);

theta_range = 0 : 0.01 : theta;
t = 0 : 0.01 : 2 * pi;
x = cos(t);
y = sin(t);
cos_theta = cos(theta);
sin_theta = sin(theta);
p = plot(h1, x, y, 'k', cos_theta, sin_theta, 'ko',...
  [0 cos_theta], [sin_theta sin_theta], 'k--',...
  [cos_theta cos_theta], [0 sin_theta], 'k--',...
  [0 cos_theta], [0 sin_theta], 'k',...
  cos(theta_range) * 0.15, sin(theta_range) * 0.15, 'k');
p(3).Color = [0 185 192] / 256;
p(3).LineWidth = 2;
p(4).Color = [231 58 142] / 256;
p(4).LineWidth = 2;
p(5).Color = [0.7 0.7 0.7];
set(h1, 'Units', 'pixels');
set(h1, 'Position', [50 60 330 330]);
set(h1, 'xtick', [-1 0 1], 'ytick', [-1 0 1]);
set(h1, 'xlim', [-1.05 1.05], 'ylim', [-1.05 1.05]);
grid(h1);

t = 0 : 0.001 : theta;
p = plot(h2, t, cos(t), t, sin(t),...
  [theta theta], [0 sin(theta)], 'k--');
p(1).Color = [0 185 192] / 256;
p(1).LineWidth = 2;
p(2).Color = [231 58 142] / 256;
p(2).LineWidth = 2;
p(3).Color = [231 58 142] / 256;
p(3).LineWidth = 2;
set(h2, 'Units', 'pixels');
set(h2, 'Position', [500 60 390 330]);
set(h2, 'xlim', [0 2 * pi]);
set(h2, 'xtick', [0 pi / 2 pi pi * 3 / 2 2 * pi]);
set(h2, 'xticklabel', [{'0'}, {'\pi/2'}, {'\pi'}, {'3\pi/2'}, {'2\pi'}]);
set(h2, 'ylim', [-1.05 1.05]);
grid(h2);
xlabel(h2, '\theta');
