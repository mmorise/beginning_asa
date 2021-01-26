% pp. 86-87
% 補足：FreeMatを使う場合はstemを本文記載の内容に修正すること．
fs=8000;
t=(0:fs-1)'/fs;
f1=3;
f2=3.5;
x1=cos(2*pi*f1*t);
X1=abs(fft(x1))/length(x1);
x2=cos(2*pi*f2*t);
X2=abs(fft(x2))/length(x2);

w=(0:length(t)-1)'*fs/length(t);
subplot(2,1,1);
stem(w,X1);
set(gca,'xlim',[0 10]);
subplot(2,1,2);
stem(w,X2);
set(gca,'xlim',[0 10]);

% pp. 87-88
fft_size=2^17;
X1=abs(fft(x1,fft_size))/length(x1);
X2=abs(fft(x2,fft_size))/length(x2);

w=(0:fft_size-1)'*fs/fft_size;
subplot(2,1,1);
plot(w,X1,'k--');
set(gca,'xlim',[0 10]);
subplot(2,1,2);
plot(w,X2,'k--');
set(gca,'xlim',[0 10]);

% p. 96
fs=44100;
win_han=MyHanning(fs);
win_ham=MyHamming(fs);
win_bla=MyBlackman(fs);
t=(0:fs-1)'/fs;
plot(t,win_han,'k',t,win_ham,'k--',t,win_bla,'k-.');

% p. 97
% 補足：結果の表示を追加．
fs=44100;
t=(0:fs-1)'/fs;
f=1000;
x=sin(2*pi*f*t);
fft_size=65536;
w=(0:fft_size/2)'*fs/fft_size;

X_han=fft(x.*MyHanning(length(x)),fft_size);
X_han=abs(X_han(1:fft_size/2+1));
spectral_centroid_han=sum(w.*X_han)/sum(X_han);

X_ham=fft(x.*MyHamming(length(x)),fft_size);
X_ham=abs(X_ham(1:fft_size/2+1));
spectral_centroid_ham=sum(w.*X_ham)/sum(X_ham);

X_bla=fft(x.*MyBlackman(length(x)),fft_size);
X_bla=abs(X_bla(1:fft_size/2+1));
spectral_centroid_bla=sum(w.*X_bla)/sum(X_bla);

fprintf('%.10f\n',spectral_centroid_han);
fprintf('%.10f\n',spectral_centroid_ham);
fprintf('%.10f\n',spectral_centroid_bla);

% p. 98
fs=44100;
N=round(fs*0.02);
fft_size=65536;
win_rect=ones(N,1);
W_rec=fftshift(abs(fft(win_rect,fft_size)));
W_rec=W_rec/max(W_rec);

w=(0:fft_size-1)'*fs/fft_size-fs/2;
plot(w,W_rec);
set(gca,'xlim',[-400 400]);
set(gca,'ylim',[0 1]);

% p. 100
fs=44100;
N=round(fs*0.02);
fft_size=65536;
win_han=MyHanning(N);
W_han=20*log10(abs(fft(win_han,fft_size)));
W_han=fftshift(W_han)-max(W_han);

win_ham=MyHamming(N);
W_ham=20*log10(abs(fft(win_ham,fft_size)));
W_ham=fftshift(W_ham)-max(W_ham);

win_bla=MyBlackman(N);
W_bla=20*log10(abs(fft(win_bla,fft_size)));
W_bla=fftshift(W_bla)-max(W_bla);

w=(0:fft_size-1)'*fs/fft_size-fs/2;
plot(w,W_han,'k',w, W_ham,'k--',w,W_bla,'k-.');
set(gca,'xlim',[-400 400]);
set(gca,'ylim',[-80 0]);

% pp. 104-105
fs=8000;
T=1;
f1=100;
f2=2000;
k=(f2-f1)/T;
t=(0:fs*T-1)'/fs;
x=sin(2*pi*(f1*t+(k/2)*t.^2));

% p. 105
fft_size=8000;
w=(0:fft_size-1)'*fs/fft_size;
plot(w,20*log10(abs(fft(x,fft_size))));
set(gca,'xlim',[0 3000]);

% p. 106
win_len=round(fs*0.02);
win=MyHanning(win_len);
fft_size=2^ceil(log2(win_len));
frame_shift=round(fs*0.01);
number_of_frames=ceil((length(x)+1)/frame_shift);
X=zeros(fft_size/2+1,number_of_frames);
base_index=ceil(-win_len/2):ceil(win_len/2)-1;

for i=0:number_of_frames-1
  center=round(i*frame_shift);
  safe_index=max(1,min(length(x),base_index+center));
  tmp=x(safe_index).*win;
  tmpX=20*log10(abs(fft(tmp,fft_size)));
  X(:,i+1)=tmpX(1:fft_size/2+1);
end

% p. 107
imagesc([0 1],[0 4000],max(X,max(X(:))-60));
colormap(gray);
colorbar;
axis('xy');
