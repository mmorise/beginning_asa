function DrawOnesample(h, f, fs)

set(h, 'Color', [1 1 1]);
set(h, 'Position', [100 100 950 200]);

p = plot([f - fs, f, f + fs, f + 2 * fs, f + 3 * fs], [0 0 0 0 0], 'o');
set(gca, 'xtick', [0, fs, 2 * fs], 'ytick', 0);
set(gca, 'xlim', [-fs fs * 3], 'ylim', [-0.1 0.1]);

grid;
xlabel('Frequency (Hz)');

p(1).Color = [0 185 192] / 256;
p(1).LineWidth = 2;

