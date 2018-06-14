function [m] = stft_2(s, N, fs)
    w=hamming(N);
    
    m=zeros(N/2, round(length(s)/N));

    for i=1:length(s)/N
        r=(((i-1)*N)+1):((i*N));
        s_fft = fft(s(r).*w);
        m(:,i)=abs(s_fft(1:N/2));
    end
    
    imagesc(fliup(m))
end

