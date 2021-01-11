function DrawSinewave(h, theta, wave_length, amplitude)
set(h, 'Color', [1 1 1]); % 色は白に
set(h, 'Position', [100 100 800 400]); % サイズを固定

t = 0 : 0.001 : 2;
plot(t, 1.1 + 0.08 * sin(wave_length * t + theta - pi / 2),...
  [0 2], [1.1 1.1], 'k');
hold on;

x_range = 0 : 0.1 : 2;
y_range = 0 : 0.1 : 1;

for i = 1 : length(x_range)
  diff_value = sin(wave_length * x_range(i) + theta) * amplitude;
  x_position = x_range(i) + diff_value;
  for j = 1 : length(y_range)
    y_position = y_range(j);
    plot(x_position, y_position, 'k.');
  end
end
set(gca, 'xtick',[], 'ytick', [])
set(gca, 'xlim', [0 2]);
set(gca, 'ylim', [0 1.2]);
set(gca, 'xcolor', 'none', 'ycolor', 'none')
hold off;
