record_flag = 0; % ムービーとして記録したい場合は1にする．

fs = 8000;
fft_size = 8192;
x = zeros(fft_size, 1);
x(2) = 1;

x_spec = fft(x, fft_size);
w = (0 : fft_size - 1) * fs / fft_size;

axis_x = real(x_spec);
axis_y = imag(x_spec);

view_1 = [90 0];
view_2 = [-10 30];

%% ここから動画のコマ出力

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('phase_spectrum1.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;
set(h, 'Color', [1 1 1]);

for i = 1 : 10 : length(w)
  subplot(2, 1, 1)
  plot(w, angle(x_spec), w(i), angle(x_spec(i)), 'ro');
  set(gca, 'xlim', [0 fs]);
  grid;
  xlabel('Frequency (Hz)')
  ylabel('Phase (rad)')
  drawnow;

  subplot(2, 1, 2)
  plot3(w, axis_x, axis_y, w(i), axis_x(i), axis_y(i), 'ro');
  hold on;
  plot3([w(i) w(i)], [0 axis_x(i)], [0 axis_y(i)], 'r');
  if axis_y(i) <= 0
    plot3(w(1 : i), axis_x(1 : i) * 0.1, axis_y(1 : i) * 0.1, 'r');
  else
    plot3(w(i : end), axis_x(i : end) * 0.1, axis_y(i : end) * 0.1, 'r');
  end
  hold off;
  set(gca, 'Units', 'points');
  set(gca, 'Position', [164, 35, 108, 108])
  view(view_1);
  grid;
  drawnow;

  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

for i = 1 : 30
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

% ビューの変更
N = 820;
diff_view = (view_2 - view_1) / N;
diff_position = ([55 326] - [164 108]) / N;
for i = 1 : N
  subplot(2, 1, 1)
  plot(w, angle(x_spec), w(end), angle(x_spec(end)), 'ro');
  set(gca, 'xlim', [0 fs]);
  xlabel('Frequency (Hz)')
  ylabel('Phase (rad)')
  grid;
  drawnow;

  subplot(2, 1, 2)
  plot3(w, axis_x, axis_y, w(end), axis_x(end), axis_y(end), 'ro');
  hold on;
  plot3([w(end) w(end)], [0 axis_x(end)], [0 axis_y(end)], 'r');  
  plot3([0 fs], [0 0], [0 0], 'k');  
  hold off;
  set(gca, 'xlim', [0 fs]);

  set(gca, 'Units', 'points');
  set(gca, 'Position', [164 + diff_position(1) * i, 35, 108 + diff_position(2) * i, 108])
  view(view_1 + diff_view * i);
  grid;
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

for i = 1 : 30
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

% 最後にもう1回表示
t = (0 : 100) / 100 * 2 * pi;
circle_x = cos(t);
circle_y = sin(t);

for i = 1 : 10 : length(w)
  subplot(2, 1, 1)
  plot(w, angle(x_spec), w(i), angle(x_spec(i)), 'ro');
  set(gca, 'xlim', [0 fs]);
  grid;
  xlabel('Frequency (Hz)')
  ylabel('Phase (rad)')
  drawnow;

  subplot(2, 1, 2)
  plot3(w, axis_x, axis_y, w(i), axis_x(i), axis_y(i), 'ro');
  hold on;
  plot3([0 fs], [0 0], [0 0], 'k');  
  plot3([w(i) w(i)], [0 axis_x(i)], [0 axis_y(i)], 'r');
  plot3(ones(101, 1) *w(i), circle_x, circle_y, 'r');
  hold off;
  set(gca, 'Units', 'points');
  set(gca, 'Position', [55, 35, 326, 108])
  view(view_2);
  grid;
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

for i = 1 : 30
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end
