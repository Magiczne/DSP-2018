function [x] = mysinT(A, f, fs, tstart, tstop)
    T=1/f;
    Tcount=abs(tstop-tstart)/T;
	t=tstart:1/fs:tstop;
    t1=tstart:0.01*(1/fs):tstop;
    x=A * sin(2* pi() * f * t);
    x1=A * sin(2* pi() * f * t1);
    
    figure;
    plot(t, x, 'ro');
    hold on;
    plot(t1, x1);
    grid on;
    title(strcat('Funkcja sinus (liczba okresów: ', num2str(Tcount), ')'));
    xlabel('czas[s]');
    ylabel('wartosc');
    hold off;