%% Materia� do �wicze� laboratoryjnych z 
%   Przetwarzania Sygna��w Cyfrowych
%   Marcin Witkowski, AGH 2017
%
% Kodowanie r�nicowe
% Przyk�ad zawiera implementacje uproszczonego kodera LPC, kt�ry zapisuje
% do plik�w d.mat i b.mat odpowiednio sygna� b��du oraz wsp�czynniki LPC
% aplikowane do ca�ego sygna�u x_ref.

clear; close all;

x1 = [ 1 2 3 4 5 6 5 4 3 2 1 0]';
[x2,fs] = audioread('imperial_march.wav');


%% Wybierz sygna�:
x_ref = x2;

%% Obliczenie sygna�u b��du d
% Zaproponuj wsp�czynniki filtru predykcyjnego do wektora b oraz oblicz
% sygna� b��du d jako:
% d(n) = 1*x_ref(n)+b(2)x_ref(n-1)+b(3)x_ref(n-2)+ .... + b(P)x_ref(n-P+1)
% Miejsce na Tw�j kod:
b = [ 1 -1 ];
d = filter(b, 1, x_ref);


%%
% Prezentacja sygna�u i sygna�u b��du:
figure(1); 
subplot(2,1,1); plot(x_ref); title('x_{ref} - Sygna� oryginalny');
subplot(2,1,2); plot(d); title('d - Sygna� b��du');

%Obliczenie entropii sygna�u b��du i sygna�u wej�ciowego
%(normalizacja dodana dla poprawnego dzia�ania funkcji entropy)
entropy_x = entropy(x_ref/max(abs(x_ref))); 
entropy_d = entropy(d/max(abs(d)));

disp(['Entropia sygna�u wej�ciowego: ' num2str(entropy_x)]);
disp(['Entropia sygna�u b��du: ' num2str(entropy_d)]);

save('d.mat','d');  % zapis wyj�ciowego 
save('b.mat','b');
save('x_ref.mat','x_ref');
