%% Materia³ do æwiczeñ laboratoryjnych z 
%   Przetwarzania Sygna³ów Cyfrowych
%   Marcin Witkowski, AGH 2017
%
% Kodowanie ró¿nicowe
% Przyk³ad zawiera implementacje uproszczonego dekodera LPC, który wczytuje
% z plików d.mat i b.mat odpowiednio sygna³ b³êdu oraz wspó³czynniki LPC
% aplikowane do ca³ego sygna³u oraz oblicza sygna³ x.

clear; close all;

d_struct = load('d.mat');
b_struct = load('b.mat');
d = d_struct.d;
b = b_struct.b;

%% Obliczenie sygna³u wyjœciowego
% Oblicz sygna³ wyjœæiowy korzystaj¹c z zale¿noœci:
% x(n) = d(n) - b(2)x(n-1) - b(3)x(n-2) - .... - b(P)x(n-P+1)
% Miejsce na Twój kod:

x = filter(1, b, d);


%%

% Porównanie sygna³ów:
x_ref_struct = load('x_ref.mat');
x_ref = x_ref_struct.x_ref;
figure(2); 
subplot(2,1,1); plot(x_ref); title('x_{ref} - Sygna³ oryginalny');
subplot(2,1,2); plot(x); title('x - Sygna³ zdekodowany');

% Binarne porównanie sygna³ów wyjœciowego z dekodera z wejœciowym z kodera
if sum(x-x_ref) < 1e-7
    disp('SUKCES! Sygna³ zdekodowany poprawnie');
else
    error('PORA¯KA! Sygna³ zdekodowany niepoprawnie');
end

