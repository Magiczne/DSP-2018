tstart = 0;
tstop = 0.002;

[t, x] = mysinT(1, 3000, 120000, tstart, tstop);
[t1, x1] = mysinT(1, 3000, 4000, tstart, tstop);
[t2, x2] = mysinT(-1, 1000, 120000, tstart, tstop);

figure;
plot(t, x);
hold on;
plot(t1, x1, 'ro');
plot(t2, x2, 'g');
grid on;
xlabel('czas[s]');
ylabel('wartosc');
hold off;