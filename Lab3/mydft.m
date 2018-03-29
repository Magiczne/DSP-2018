function [X,W, Xph] = mydft(x, sr)
N = length(x);
w = exp((-1j*2*pi())/N);
W=zeros(N,N);

for k=0:N-1
    for n=0:N-1
        W(k+1,n+1)=w^(k*n);
    end;
end;

X=W*x';

Xamp=abs(X);
Xph=angle(X);

subplot(3,1,1)
plot(x, 0:(N-1)/sr:(1/sr));
subplot(3,1,2)
plot(Xamp);
% plot(Xph);
