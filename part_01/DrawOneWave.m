function DrawOneWave(h, fs, b, a)

set(h, 'Color', [1 1 1]);
set(h, 'Position', [100 100 1200 400]);
h1 = subplot(1, 2, 1);
h2 = subplot(1, 2, 2);

t = 0 : 0.01 : 2 * pi;
x = cos(t);
y = sin(t);
p = plot(h1, x, y, 'k',...
  b, a, 'ko', [0 b], [0 a], 'k--',...
  b, -a, 'ko', [0 b], [0 -a], 'k--');
p(4).Color = [0.7 0.7 0.7];
p(5).Color = [0.7 0.7 0.7];
xlabel(h1, 'Re');
ylabel(h1, 'Im');
set(h1, 'Units', 'pixels');
set(h1, 'Position', [50 60 330 330]);
set(h1, 'xtick', [-1 0 1], 'ytick', [-1 0 1]);
set(h1, 'xlim', [-1.05 1.05], 'ylim', [-1.05 1.05]);
grid(h1);

t = 0 : 0.001 : 1;
f = atan2(a, b) * fs;
x = cos(f * t);
r = sqrt(a ^ 2 + b ^ 2);
alpha = log(r);
envelope = exp(alpha * t);
y = x .* envelope;
plot(h2, t, y, t, envelope, 'r--', t, -envelope, 'r--');
set(h2, 'Units', 'pixels');
set(h2, 'Position', [500 60 690 330]);
set(h2, 'xtick', [-1 0 1]);
set(h2, 'ylim', [-1.05 1.05]);
grid(h2);
xlabel(h2, 'Time (s)');
ylabel(h2, 'Amplitude');
