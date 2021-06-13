record_flag = 0; % ムービーとして記録したい場合は1にする．

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('nyquist2.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;

fs = 8000;

% 1秒停止
for f = 1 : 60
  DrawOnesample2(h, 0, fs);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

% 負の周波数成分も見る
step = 1 / 600;
freq_range = (0 : step : 1) * fs;
for f = freq_range
  DrawOnesample2(h, f, fs);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

% 1秒停止
for f = 1 : 60
  DrawOnesample2(h, fs, fs);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end
