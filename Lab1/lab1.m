clear variables;

ts=0;   
tk=1;
f=4;
A=3;
dt=0.001;

t=ts:dt:tk-dt;

y=A * sin(2 * pi() * f * t);

plot(t, y);
title('sin(2*pi*f*t)');
xlabel('t');
ylabel('y');


B=[3, 5, 7, 9];
C=[1, 2, 3, 4];
dot_BC=B .* C; %k³amstwo >:/
dot_BC2=B * C';

