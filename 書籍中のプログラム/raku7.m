% pp. 147-148
fs=48000;
f=22000;
t=(0:100)'/fs;
x=sin(2*pi*f*t);
y=x(1:2:end);
fs2=24000;
t2=(0:length(y)-1)'/fs2;

subplot(2,1,1);
plot(t*1000,x,'k',t2*1000,y,'ko');
set(gca,'xlim',[0 1]);
subplot(2,1,2);
plot(t2*1000,y,'k');
set(gca,'xlim',[0 1]);

% p. 150
n=(-15:15)';
h=sin(0.5*pi*n)./(0.5*pi*n)/2;
h(16)=0.5;
h=h.*MyHanning(31);
h=h/sum(h);

% p. 151
x=(-50:50)';
fft_size=2^ceil(log2(length(x)+30));
spec_x=fft(x,fft_size);
spec_h=fft(h,fft_size);
y=real(ifft(spec_x.*spec_h));

% p. 152
xx=[ones(15,1)*x(1);x;ones(15,1)*x(end)];

% p. 153
xx=[ones(15,1)*x(1);x;ones(15,1)*x(end)];
fft_size=2^ceil(log2(length(xx)+30));
spec_x=fft(xx,fft_size);
spec_h=fft(h,fft_size);
y=real(ifft(spec_x.*spec_h));
time_index=(1:2:length(x))';
y=y(30+time_index);

% p. 156
fs=44100;
fft_size=65536;
x=zeros(fft_size,1);
x(1)=1;
range=(-13:12)';
fc=1000*2.^(range/3);
cumulative_power=cumsum(abs(fft(x,fft_size)).^2);
w=(0:fft_size-1)'*fs/fft_size;
fl=fc*2^(-1/6);
fu=fc*2^(1/6);
upper_level=MyInterp1(w,cumulative_power,fu);
lower_level=MyInterp1(w,cumulative_power,fl);
Ln=10*log10(upper_level-lower_level);

% p. 158
semilogx(fc,Ln);

% p. 159
% 補足：結果の再生を追加．
fs=44100;
f=1000;
t=(0:fs)'/fs;
x=sin(2*pi*f*t);
soundsc(x, fs);

% pp. 161-162
fs=44100;
x=randn(fs,1);
fft_size=2^ceil(log2(length(x)));
range=(-19:12)';
fc=1000*2.^(range/3);
cumulative_power=cumsum(abs(fft(x.*MyBlackman(fs),fft_size)).^2);
w=(0:fft_size-1)'*fs/fft_size;
fl=fc*2^(-1/6);
fu=fc*2^(1/6);
upper_level=MyInterp1(w,cumulative_power,fu);
lower_level=MyInterp1(w,cumulative_power,fl);
weight=[-63.4;-56.7;-50.5;-44.7;-39.4;-34.6;-30.2;...
  -26.2;-22.5;-19.1;-16.1;-13.4;-10.9;-8.6;-6.6;...
  -4.8;-3.2;-1.9;-0.8;0;0.6;1.0;1.2;1.3;1.2;1.0;...
  0.5;-0.1;-1.1;-2.5;-4.3;-6.6];
Ln=10*log10(upper_level-lower_level)+weight;
Laeq=10*log10(sum(10.^(Ln/10)));

% p. 163
fs=44100;
fft_size=65536;
w=(0:fft_size-1)'*fs/fft_size;
x=randn(fft_size,1);
spec=abs(fft(x)).^2;
plot(w,spec);

% p. 164
fft_size=1024;
x=randn(fft_size,1);
x=x/sqrt(sum(x.^2));
spec=abs(fft(x)).^2;
power_std=std(spec(1:fft_size/2+1));

% p. 165
% このスクリプトは環境によってはかなり時間がかかります．
% 特にFreeMatを利用する場合は，時間に余裕があるときに試してください．
N=100;
fft_size=65536;
result=zeros(N,1);
for i=1:N
  tmp_spec=zeros(i,fft_size/2+1);
  for j=1:i
    power_spec=abs(fft(randn(fft_size,1))).^2;
    tmp_spec(j,:)=power_spec(1:fft_size/2+1)/fft_size;
  end
  spec=mean(tmp_spec,1);
  result(i)=std(spec);
end

subplot(2,1,1);
plot(1:N,result);
subplot(2,1,2);
loglog(1:N,result);

% p. 169
% 補足：FreeMatを使う場合，rng(10)は動作しないのでカットしてください．
rng(10);
fs=44100;
fft_size=65536;
f0=100;
T0=round(fs/f0);
h=randn(T0,1);
x=zeros(fft_size-T0+1,1);
for i=1:T0:length(x)
  x(i)=1;
end
spec_x=fft(x,fft_size);
spec_h=fft(h,fft_size);
y=real(ifft(spec_x.*spec_h));

% p. 170
fft_size2=65536*16;
w=(0:fft_size2-1)'*fs/fft_size2;
win_y=y.*MyHanning(fft_size);
plot(w,20*log10(abs(fft(win_y,fft_size2))));
set(gca,'xlim',[0 500]);
set(gca,'ylim',[40 70]);

% p. 172
win_len_half=floor(0.03*fs/2);
win_len=win_len_half*2+1;
fft_size=2^ceil(log2(win_len*2));
frame_shift=round(0.005*fs);

% pp. 172-173
f0_floor=40;
T0_floor=ceil(fs/f0_floor);
f0_ceil=800;
T0_ceil=floor(fs/f0_ceil);
threshold=0.2;

% p. 173
range=(0:frame_shift:length(y))';
time_axis=(0:length(y)-1)'/fs;
f0_contour=zeros(length(range),1);
for i=1:length(range)
  index=range(i)-win_len_half:range(i)+win_len_half;
  safe_index=max(1,min(index,length(y)));
  tmp_y=y(safe_index);
  r=real(ifft(abs(fft(tmp_y,fft_size)).^2));
  r=r/r(1);
  r(1:T0_ceil)=0;
  r(T0_floor:end)=0;
  [cor,max_index]=max(r);
  if cor>threshold
    f0_contour(i)=1/time_axis(max_index);
  end
end

% p. 177
fft_size2=65536*16;
w=(0:fft_size2-1)'*fs/fft_size2;
spec_y=abs(fft(y.*MyHanning(length(y)),fft_size2));
harmonics=MyInterp1(w,spec_y,(1:4)'*f0);
amp42=20*log10(harmonics(4)/harmonics(2));
amp31=20*log10(harmonics(3)/harmonics(1));
