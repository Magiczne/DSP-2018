function [x] = mysinN(A, f, fs, tstart, N)
    T=1/f;
    tstop=(N * T) + tstart;
	t=tstart:1/fs:tstop;
    t1=tstart:0.01:tstop;
    x=A * sin(2* pi() * f * t);
    x1=A * sin(2* pi() * f * t1);
    
    figure;
    plot(t, x, 'ro');
    hold on;
    plot(t1, x1);
    grid on;
    title(strcat('Funkcja sinus (liczba okresów: ', num2str(N), ')'));
    xlabel('czas[s]');
    ylabel('wartosc');
    hold off;