function [X,W, Xamp, Xph] = mydft(x, sr)
N = length(x);
w = exp((-1j*2*pi())/N);
W=zeros(N,N);
t=(N-1)/sr; 

for k=0:N-1
    for n=0:N-1
        W(k+1,n+1)=w^(k*n);
    end
end

X=W*x';

Xamp=abs(X);
Xph=atan(imag(X)/real(X));

f=0:1/t:((N-1)/t);

subplot(3, 1, 1)
plot(0:1/sr:t,x);
subplot(3, 1, 2)
plot(f, Xamp);
subplot(3, 1, 3)
plot(f, Xph);
