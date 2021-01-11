% 洗練されていないですがそのまま公開します．
fs = 48000;
f = 1;
t = 0 : 0.1 : 1;
frame_rate = 30;
myVideo = VideoWriter('quantization.mp4',  'MPEG-4');
myVideo.FrameRate = frame_rate;
open(myVideo);

close all;
h = figure;
set(h, 'Color', [1 1 1]); % 色は白に

color_range = [0.8 0.8 0.8];
v_range = [-1.05 1.05];
circle_gray = [0.5 0.5 0.5];

coef = 1 / 600; % 1フレームあたりの時間
% 60フレーム(2秒)で1ビット表現する
one_action_frame = 120;
for j = 2 : 5
  for i = 1 : one_action_frame
    plot([0 0], v_range, 'color', color_range);
    hold on;
    for k = 0.1 : 0.1 : 0.9
      plot([k k], v_range, 'color', color_range);
    end
    
    for k = 0 : 2 ^ j - 1
      y_axis = (k - ((2 ^ j) / 2)) / ((2 ^ j) / 2);
      plot([0 1], [y_axis y_axis], 'color', color_range);
    end
    x = sin(2 * pi * f * t);
    y = min(2 ^ j - 1, round((x + 1) * 2 ^ (j - 1))) / (2 ^ (j - 1)) - 1;
    err = x - y;
    
    plot(t, x, 'o', 'color', circle_gray);
    plot(t, x - err * i / one_action_frame, 'dk');
    hold off;
    
    y_tick = ((0 : (2 ^ j) - 1) - (2 ^ (j - 1))) / (2 ^ (j - 1));
    
    title_text = sprintf('%d bits', j);
    title(title_text);
    if j < 5
    set(gca, 'ytick', y_tick);
    end
    set(gca, 'xtick', [0 : 0.1 : 1]);
    set(gca, 'ylim', v_range);
    xlabel('Time (s)');

    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
  for i = 1 : 60
    M = getframe(gcf);
    writeVideo(myVideo, M);
  end
end

close(myVideo);
