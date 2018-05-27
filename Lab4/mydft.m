function [X,W] = mydft(x)
N = length(x);
w = exp((-1j*2*pi())/N);
W=zeros(N,N);


for k=0:N-1
    for n=0:N-1
        W(k+1,n+1)=w^(k*n);
    end
end

X=W*x';
