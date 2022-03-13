record_flag = 0; % ムービーとして記録したい場合は1にする．

N = 1200;
w = (0 : N - 1) / N;

axis_x = 2 * (w - 0.5);
axis_y = axis_x .^ 3;
x_spec = axis_x + 1i * axis_y;
view_1 = [90 0];

%% ここから動画のコマ出力

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('phase_spectrum2.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;
set(h, 'Color', [1 1 1]);

% 最初のフレームを描画
i = 1;
subplot(2, 1, 1)
plot(w, angle(x_spec), w(i), angle(x_spec(i)), 'ro');
set(gca, 'xlim', [0 1]);
set(gca, 'ylim', [-pi pi]);
grid;
ylabel('Phase (rad)')
drawnow;
subplot(2, 1, 2)
plot3(w, axis_x, axis_y, w(i), axis_x(i), axis_y(i), 'ro');
hold on;
plot3([w(i) w(i)], [0 axis_x(i)], [0 axis_y(i)], 'r');
hold off;
set(gca, 'Units', 'points');
set(gca, 'Position', [164, 35, 108, 108])
view(view_1);
grid;
drawnow;
for i = 1 : 30
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

for i = 1 : length(w)
  subplot(2, 1, 1)
  plot(w, angle(x_spec), w(i), angle(x_spec(i)), 'ro');
  set(gca, 'xlim', [0 1]);
  grid;
  ylabel('Phase (rad)')
  set(gca, 'ylim', [-pi pi]);
  drawnow;

  subplot(2, 1, 2)
  plot3(w, axis_x, axis_y, w(i), axis_x(i), axis_y(i), 'ro');
  hold on;
  plot3([w(i) w(i)], [0 axis_x(i)], [0 axis_y(i)], 'r');
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

if record_flag == 1
  close(myVideo);
end

