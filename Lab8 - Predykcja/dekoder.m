%% Materia� do �wicze� laboratoryjnych z 
%   Przetwarzania Sygna��w Cyfrowych
%   Marcin Witkowski, AGH 2017
%
% Kodowanie r�nicowe
% Przyk�ad zawiera implementacje uproszczonego dekodera LPC, kt�ry wczytuje
% z plik�w d.mat i b.mat odpowiednio sygna� b��du oraz wsp�czynniki LPC
% aplikowane do ca�ego sygna�u oraz oblicza sygna� x.

clear; close all;

d_struct = load('d.mat');
b_struct = load('b.mat');
d = d_struct.d;
b = b_struct.b;

%% Obliczenie sygna�u wyj�ciowego
% Oblicz sygna� wyj��iowy korzystaj�c z zale�no�ci:
% x(n) = d(n) - b(2)x(n-1) - b(3)x(n-2) - .... - b(P)x(n-P+1)
% Miejsce na Tw�j kod:

x = filter(1, b, d);


%%

% Por�wnanie sygna��w:
x_ref_struct = load('x_ref.mat');
x_ref = x_ref_struct.x_ref;
figure(2); 
subplot(2,1,1); plot(x_ref); title('x_{ref} - Sygna� oryginalny');
subplot(2,1,2); plot(x); title('x - Sygna� zdekodowany');

% Binarne por�wnanie sygna��w wyj�ciowego z dekodera z wej�ciowym z kodera
if sum(x-x_ref) < 1e-7
    disp('SUKCES! Sygna� zdekodowany poprawnie');
else
    error('PORA�KA! Sygna� zdekodowany niepoprawnie');
end

