% p. 43
fs=44100;
t=(0:fs-1)'/fs;
r=1.5;
theta=0.3;
x=r*cos(2*pi*t-theta);

% p. 44
a=2/fs*sum(x.*cos(2*pi*t));
b=2/fs*sum(x.*sin(2*pi*t));

sqrt(a^2+b^2)
atan2(b,a)

% p. 45
% 補足：振幅と位相の計算結果の表示を追加
fs=44100;
r=1.5;
theta=0.3;
f=2;
L=1/f;
t=(0:(fs*L)-1)'/fs;
x=r*cos(2*pi*t/L-theta);
a=2/fs/L*sum(x.*cos(2*pi*t/L));
b=2/fs/L*sum(x.*sin(2*pi*t/L));

sqrt(a^2+b^2)
atan2(b,a)

% p. 47
% 補足：nとmの値を変えながら試してみよう．
fs=44100;
r=1.5;
theta=0.3;
n=2;
m=3;
t=(0:fs-1)'/fs;
x=r*cos(2*pi*n*t-theta);
a=2/fs*sum(x.*cos(2*pi*m*t))
b=2/fs*sum(x.*sin(2*pi*m*t))

% p. 48
fs=44100;
n1=1;
r1=1.5;
theta1=0.3;
n2=3;
r2=0.3;
theta2=1.1;
t=(0:fs-1)'/fs;
x=r1*cos(2*pi*n1*t-theta1)+r2*cos(2*pi*n2*t-theta2);

a=2/fs*sum(x.*cos(2*pi*t*3));
b=2/fs*sum(x.*sin(2*pi*t*3));
sqrt(a.^2+b.^2)
atan2(b,a)

% p. 54
fs=44100;
f1=1;
r1=1.5;
theta1=0.3;
f2=3;
r2=0.2;
theta2=-1.1;
t=(0:fs-1)'/fs;
x=r1*cos(2*pi*f1*t-theta1)+r2*cos(2*pi*f2*t-theta2);

% p. 55
% 補足：本文中で書いているコマンドも追加．
k1=1;
c1=sum(x.*exp(-1i*2*pi*k1*t))/fs;
k3=3;
c3=sum(x.*exp(-1i*2*pi*k3*t))/fs;

abs(c1)
angle(conj(c1))

% p. 58
fs=8;
f=0; % ここを0から4まで順番に試してみよう．
r=0.5;
t=(0:fs-1)'/fs;
x=r*cos(2*pi*f*t);
c=sum(x.*exp(-1i*2*pi*f*t))/fs;
abs(c)

% pp. 60-61
N=8;
x=randn(N,1);
c=zeros(N,1);
for i=0:N-1
  c(i+1)=sum(x.*exp(-1i*2*pi*i*(0:N-1)'/N));
end
X=fft(x);
