% p. 123
fs=44100;
x=randn(fs,1);
y=zeros(fs,1);
y(1)=0.5*x(1);
for n=2:length(x)
  y(n)=0.5*x(n)-0.5*x(n-1);
end

% p. 124
fs=44100;
fft_size=65536;
w=(0:fft_size-1)'*fs/fft_size;
plot(w/1000,abs(fft([0.5;-0.5],fft_size)));
set(gca,'xlim',[0 fs/2000]);

% p. 127
N=128;
k=(0:N-1)';
spec1=abs(1./(1-0.5*exp(-1i*2*pi*k/N)));

% pp. 127-128
h=zeros(N,1);
h(1)=1;
for n=2:N
  h(n)=0.5*h(n-1);
end
spec2=abs(fft(h));

% p. 128
subplot(2,1,1);
plot(k,spec1);
set(gca,'xlim',[0 N-1]);
subplot(2,1,2);
plot(k,spec2);
set(gca,'xlim',[0 N-1]);

% p. 135
fs=44100;
fft_size=65536;
fc=100;
w=(0:fft_size-1)'*fs/fft_size;
fc_index=round(fft_size*fc/fs)+1;
amp_spec=ones(fft_size/2+1,1);
amp_spec(fc_index+1:end)=0;

% p. 136
spec=[amp_spec;amp_spec(end-1:-1:2)];
impulse_response=fftshift(real(ifft(spec)));

% p. 138
fft_size2=65536*16;
w2=(0:fft_size2-1)'*fs/fft_size2;
plot(w,abs(fft(impulse_response)),'ko',...
  w2,abs(fft(impulse_response,fft_size2)),'k');
set(gca,'xlim',[95 105]);

% p. 140
half_N=32767;
window_index=(fft_size/2-half_N:fft_size/2+half_N)'+1;
h=impulse_response(window_index).*MyBlackman(half_N*2+1);

% p. 143
fs=44100;
fft_size=65536;
fc=100;
w=(0:fft_size-1)'*fs/fft_size;
fc_index=round(fft_size*fc/fs)+1;
amp_spec=ones(fft_size/2+1,1);
amp_spec(fc_index+1:end)=0.01;
spec=[amp_spec;amp_spec(end-1:-1:2)];
impulse_response=fftshift(real(ifft(spec)));
impulse_response(1)=0;
impulse_response(2:fft_size)=...
  impulse_response(2:fft_size).*MyBlackman(fft_size-1);
minimum_phase_response=MinimumPhase(impulse_response);
plot((0:fft_size-1)'/fs,minimum_phase_response);

% p. 144
fft_size2=65536*16;
w2=(0:fft_size2-1)'*fs/fft_size2;
plot(w2,abs(fft(impulse_response,fft_size2)),'k',...
  w2,abs(fft(minimum_phase_response,fft_size2)),'k--');
set(gca,'xlim',[95 105]);
