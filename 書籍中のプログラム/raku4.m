% p. 63
fs=44100;
t=(0:fs*2-1)'/fs;
f=5;
x=sin(2*pi*t*f);
X=fft(x);

% p. 64
w=(0:length(x)-1)'*fs/length(x);

plot(w,abs(X));
set(gca,'xlim',[0 50]);

% p. 65
fs=44100;
t=(0:fs-1)'/fs;
f=5;
x=sin(2*pi*t*f);
fft_size=2^ceil(log2(length(x)));
X1=fft(x);
X2=fft(x,fft_size);

% p. 66
w=(0:fft_size-1)'*fs/fft_size;
plot(w,abs(X2));
set(gca,'xlim',[0 50]);

% p. 67
fprintf('%.2f\n',sum(x.^2));
fprintf('%.2f\n',sum(abs(X1).^2)/length(X1));
fprintf('%.2f\n',sum(abs(X2).^2)/fft_size);

% p. 68
fs=44100;
t=(0:fs-1)'/fs;
f1=10;
f2=100;
r1=1;
r2=2;
x1=r1*sin(2*pi*f1*t);
x2=r2*sin(2*pi*f2*t);
x=x1+x2;
X=fft(x);

fprintf('%.2f\n',sum(x1.^2));
fprintf('%.2f\n',sum(x2.^2));
fprintf('%.2f\n',sum(x.^2));

% p. 69
p1=20*log10(sum(abs(X(1:20))));
p2=20*log10(sum(abs(X(91:110))));

% p. 70
fs=8000;
x=zeros(fs,1);
m=1;
x(1+m)=1;
fft_size=2^ceil(log2(length(x)));
X=fft(x,fft_size);

% p. 71
w=(0:fft_size-1)'*fs/fft_size;
plot(w,angle(X));

% p. 72
% 補足：unwrap関数はFreeMatでは動作しません．
plot(w,unwrap(angle(X)));

% p. 74
% 補足：unwrap関数はFreeMatでは動作しません．
fs=44100;
fft_size=65536;
x=zeros(fft_size,1);
x(2)=1;
X=fft(x,fft_size);
w=(0:fft_size-1)'*fs/fft_size;
phase_delay=-unwrap(angle(X))./(2*pi*w);
plot(w,phase_delay*fs);

% p. 77
fs=44100;
fft_size=65536;
x=zeros(fft_size,1);
x(2)=1;
t=(0:length(x)-1)';
X=fft(x,fft_size);
Xd=fft(-1i*t.*x,fft_size);
tau_d=(real(Xd).*imag(X)-real(X).*imag(Xd))./abs(X).^2;

w=(0:fft_size-1)'*fs/fft_size;
plot(w,tau_d);

% p. 79
% 補足：本文中で書いているコマンドを追加．
fs=44100;
N=22050;
x=randn(N,1);
energy=sum(x.^2)/fs;
x=x/sqrt(energy);
t=(0:length(x)-1)'/fs;
t_c1=sum(t.*x.^2)/fs;

fft_size=2^ceil(log2(length(x)));
X=fft(x,fft_size);
Xd=fft(-1i*t.*x,fft_size);
tau_d=(real(Xd).*imag(X)-real(X).*imag(Xd))./abs(X).^2;
t_c2=sum(tau_d.*abs(X).^2)/fs/fft_size;

fprintf('%.20f\n',t_c1);
fprintf('%.20f\n',t_c2);

% pp. 80-81
fs=44100;
N=22050;
x=randn(N,1);
energy=sum(x.^2)/fs;
x=x/sqrt(energy);
t=(0:length(x)-1)'/fs;
t_c=sum(t.*x.^2)/fs;
sigma_t1=sum((t-t_c).^2.*x.^2)/fs;

fft_size=2^ceil(log2(length(x)));
X=fft(x,fft_size);
Xd=fft(-1i*t.*x,fft_size);
tau_d=(real(Xd).*imag(X)-real(X).*imag(Xd))./abs(X).^2;
d1=((real(X).*real(Xd)+imag(X).*imag(Xd))./abs(X)).^2;
d2=(-tau_d+t_c).^2.*abs(X).^2;
sigma_t2=(sum(d1)+sum(d2))/fft_size/fs;

fprintf('%.20f\n',sigma_t1);
fprintf('%.20f\n',sigma_t2);

% pp. 83-84
fs=44100;
t=(0:fs-1)'/fs;
f=1000;
x=sin(2*pi*f*t);
fft_size=65536;
X=fft(x,fft_size);
X=abs(X(1:fft_size/2+1));
w=(0:fft_size/2)'*fs/fft_size;
spectral_centroid=sum(w.*X)/sum(X);
