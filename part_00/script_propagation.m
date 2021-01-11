% これだけ別日に作ったので書き方が違います．
record_flag = 0; % ムービーとして記録した場合は1にする．

frame_rate = 60;
myVideo = VideoWriter('propagation.mp4', 'MPEG-4');
myVideo.FrameRate = frame_rate;
if record_flag == 1
  open(myVideo);
end

close all;
h = figure;
amplitude = 0.1;

wave_length = 2 * pi;
for theta = 0 : 0.01 : 8 * pi
  DrawSinewave(h, -theta, wave_length, amplitude)
  drawnow;
  if record_flag == 1
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

if record_flag == 1
	close(myVideo);
end

