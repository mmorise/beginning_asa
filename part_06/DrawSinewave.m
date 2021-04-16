function DrawSinewave(h, f, r, theta)
fs = 48000;
t = (0 : fs - 1) / fs;

set(h, 'Color', [1 1 1]);
set(h, 'Position', [100 100 950 400]);

x = r * cos(2 * pi * f * t - theta);
p = plot(t, x);
set(h, 'Position', [50 60 640 480]);
set(gca, 'xtick', [0 1], 'ytick', [-1 -0.5 0 0.5 1]);
set(gca, 'xlim', [0 1], 'ylim', [-1.05 1.05]);
grid;
xlabel('Time (s)');
ylabel('Amplitude');

title_text = sprintf('{\\it r}: %.2f, {\\it f}: %.2f, \\theta : %.2f', r, f, theta);
title(title_text);

p(1).Color = [0 185 192] / 256;
p(1).LineWidth = 2;

