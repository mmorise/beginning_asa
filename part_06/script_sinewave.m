record_flag = 0; % ムービーとして記録したい場合は1にする．

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('sinewave.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;

step = 1 / 120;
amp_range = [1 : -step : 0, 0 : step : 1];
for r = amp_range
  DrawSinewave(h, 1, r, 0);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end
for i = 1 : 30 % 1秒停止
  DrawSinewave(h, 1, 1, 0);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

step = 2 / 120;
freq_range = [1 : step : 3, 3 : -step : 1];
for f = freq_range
  DrawSinewave(h, f, 1, 0);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end
for i = 1 : 30 % 1秒停止
  DrawSinewave(h, 1, 1, 0);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

step = 2 * pi / 120;
phase_range = [0 : step : 2 * pi, 2 * pi : -step : 0];
for phase = phase_range
  DrawSinewave(h, 1, 1, phase);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end
for i = 1 : 30 % 1秒停止
  DrawSinewave(h, 1, 1, 0);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end
