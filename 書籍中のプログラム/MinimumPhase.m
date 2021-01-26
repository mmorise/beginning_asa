function y=MinimumPhase(x)
x_len_half=length(x)/2-1;
X=real(ifft(log(abs(fft(x(:))))));
w=[1;2*ones(x_len_half,1);1;zeros(x_len_half,1)];
y=real(ifft(exp(fft(w.*X))));