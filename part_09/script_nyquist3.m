record_flag = 1; % ムービーとして記録したい場合は1にする．

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('nyquist3.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;

fs = 8000;

% 初期状態で1秒停止
for f = 1 : 60
  DrawOnesample3(h, 0, fs);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

% ナイキスト周波数を加味
step = 1 / 600;
freq_range = (0 : step : 0.5) * fs;
for f = freq_range
  DrawOnesample3(h, f, fs);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

% 最終状態で1秒停止
for f = 1 : 60
  DrawOnesample3(h, fs / 2, fs);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end
