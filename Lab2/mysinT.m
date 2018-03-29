function [t,  x] = mysinT(A, f, fs, tstart, tstop)
	t=tstart:1/fs:tstop;
    x=A * sin(2* pi() * f * t);

    