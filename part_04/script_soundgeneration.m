% 人間が音の大きさを判断する時間幅を調べる簡単な実験
fs = 48000;

interval_list_ms = [1, 10, 20, 40, 60, 80, 100, 150, 200, 250, 300, 350, 400, 450, 500];
for i = interval_list_ms
  tmp_signal = [randn(round(i * fs / 1000), 1); zeros(fs, 1)] / 5;
  filename = sprintf('output%d.wav', i);
  audiowrite(filename, tmp_signal, fs);
end
