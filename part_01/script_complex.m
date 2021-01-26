record_flag = 0; % ムービーとして記録したい場合は1にする．

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('Euler.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;

step = 0.005;
fs = 40;
for theta = 0 : step : pi / 2
  DrawOneWave(h, fs, cos(theta), sin(theta));
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

for r = 1 : -step : 0.002
  DrawOneWave(h, fs, r * cos(theta), r * sin(theta));
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end
