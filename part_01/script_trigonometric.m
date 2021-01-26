record_flag = 1; % ムービーとして記録したい場合は1にする．

if record_flag == 1
  frame_rate = 60;
  myVideo = VideoWriter('trigonometric.mp4', 'MPEG-4');
  myVideo.FrameRate = frame_rate;
  open(myVideo);
end

close all;
h = figure;

step = 0.005;
fs = 40;
for theta = 0 : step : 2 * pi
  DrawSinewave(h, theta);
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end
