%% Materia� do �wicze� laboratoryjnych z 
%   Cyfrowego Przetwarzania Sygna��w
%   Marcin Witkowski, AGH 2016
%
% Funkcja MYLPF zwraca wsp�czynniki filtru zaprojektowanego metod� okien
%   czasowych.
%
% WEJ�CIE:
%   fgr - cz�stotliwo�� graniczna w Hz
%   fs - cz�stotliwo�� pr�bkowania  w Hz
%   N - rz�d filtru
% WYJ�CIE:
%   b - wsp�czynniki filtru typu FIR

function b = myLPF(fgr, fs, N)
%% ---------------------
% Miejsce na Tw�j kod:
fn=fs/2;
fg=fgr/fn;

n = -N/2:N/2;
b = fg*sinc(fg*n);
% ---------------------
%% 
