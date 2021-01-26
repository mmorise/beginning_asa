% p. 18
fs=44100;
t=(0:fs/2-1)/fs;
x=sin(2*pi*t);

S=sum(x)/fs

% p. 20
n=0:20;
omega=0.1*2*pi;
x1=sin(omega*n);
x2=sin((omega+2*pi)*n);

% p. 21
subplot(2,1,1);
plot(n,x1);
subplot(2,1,2);
plot(n,x2);

plot(x1-x2);

% p. 22
set(gca,'ylim',[-1 1]);

ylim([-1 1]);

% p. 23
% 補足：直流成分除去のイメージを説明する意図で，xが未定義だと動きません．
x=x-mean(x);

% p. 24
N=1000; % この値を大きくしながら何度か実行してみよう．
x1=randn(N,1);
x2=randn(N,1);

x1=x1-mean(x1);
x2=x2-mean(x2);

L_p=10*log10(sum(x1.^2)/sum(x2.^2));

% p. 25
% FreeMatを使っている場合は書籍を参考に書き換えてください．
rng(0);

% p. 26
% 補足：p. 24の必要部分も記載
N=1000;
a=2;
x1=randn(N,1)*2;
x2=randn(N,1);

x1=x1-mean(x1);
x2=x2-mean(x2);

L_p=10*log10(sum(x1.^2)/sum(x2.^2))

% p. 26
fs=44100;
t=(0:fs-1)'/fs;
x1=zeros(fs,1);
x1(fs/2-500+1:fs/2+500+1)=1;
x2=zeros(fs,1);
x2(fs/4-1000+1:fs/4+1000+1)=1;

% p. 27
subplot(2,1,1);
plot(t,x1);
subplot(2,1,2);
plot(t,x2);

% p. 28
energy=sum(x1.^2)/fs;
xx1=x1/sqrt(energy);
sum(xx1.^2)/fs

t_c=sum(t.*xx1.^2)/fs;

% p. 29
fprintf('%.10f\n',t_c);

% p. 30
energy=sum(x1.^2)/fs;
xx1=x1/sqrt(energy);
t_c=sum(t.*xx1.^2)/fs;
sigma_t=sum((t-t_c).^2.*xx1.^2)/fs;

fprintf('%.10f\n',sigma_t);

t_c1=sum(t.*xx1.^2)/fs;
t_c2=sum(t.^2.*xx1.^2)/fs;
sigma_t=t_c2-t_c1^2;
fprintf('%.20f\n',sigma_t); % 本文には書かれていないが追加

% p. 31
fprintf('%.20f\n',fs/sum(x1.^2)/3*(2*(500.5/fs)^3));

% pp. 32-33
fs=100;
t=(0:fs-1)'/fs;
f=1;
signal=sin(2*pi*f*t);
noise=randn(fs,1);

% p. 33
10*log10(sum(signal.^2))
10*log10(sum(noise.^2))

snr=6;
noise=noise/sqrt(sum(noise.^2));
noise=noise*sqrt(sum(signal.^2));
noise=noise*10^(-snr/20);

% p. 34
10*log10(sum(signal.^2)/sum(noise.^2))

x=signal+noise;

y=zeros(length(x),1);
M=5;
for i=M+1:length(y)-M
  y(i)=mean(x(i-M:i+M));
end

% p. 36
% FreeMatを使っている場合はmedianをMyMedianに置き換えること．
y=zeros(length(x),1);
M=5;
for i=M+1:length(y)-M
  y(i)=median(x(i-M:i+M));
end

% p. 37
% FreeMatを使っている場合はrandiの書式を変えること．
noise=zeros(fs,1);
number_of_pulses=5;
for i=1:number_of_pulses
  noise(randi(length(noise)))=2*round(rand)-1;
end
x=signal+noise;
