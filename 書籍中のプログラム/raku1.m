% p. 2
x=[1,3,-5,2];

% p. 3
plot(x);

fs=10;
t=(0:3)/fs;
plot(t,x);

% p. 4
xlabel('Time (s)');
ylabel('Amplitude');

% p. 5
x=[1,3,-5,2];
y=[1;3;-5;2];

% p. 6
x=[1,3,-5,2];
y=[1,3,-5,2];
inner_product=sum(x.*y); % 結果は39

inner_product=x*y'; 

% p. 7
% 補足：FreeMatを使う場合sound関数はwavplay関数に置き換えること．
fs=44100;
t=(0:fs-1)/fs;
f=1; % 1回実行後，fを1000にして再度実行してみよう．
x=sin(2*pi*f*t);

plot(t,x);

sound(x,fs);

% p. 9
x=3+4*1i;
r=abs(x);
theta=angle(x);

% p. 10
real(x)
imag(x)

% p. 11
exp(1i*pi/2)
exp(1i*pi)
exp(1i*2*pi)

% p. 13
x=[1,3,-5,2];

% p. 14
x=[1,3,-5,2];
h=[1,2,1];
y=conv(x,h);
