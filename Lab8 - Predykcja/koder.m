%% Materia³ do æwiczeñ laboratoryjnych z 
%   Przetwarzania Sygna³ów Cyfrowych
%   Marcin Witkowski, AGH 2017
%
% Kodowanie ró¿nicowe
% Przyk³ad zawiera implementacje uproszczonego kodera LPC, który zapisuje
% do plików d.mat i b.mat odpowiednio sygna³ b³êdu oraz wspó³czynniki LPC
% aplikowane do ca³ego sygna³u x_ref.

clear; close all;

x1 = [ 1 2 3 4 5 6 5 4 3 2 1 0]';
[x2,fs] = audioread('imperial_march.wav');


%% Wybierz sygna³:
x_ref = x2;

%% Obliczenie sygna³u b³êdu d
% Zaproponuj wspó³czynniki filtru predykcyjnego do wektora b oraz oblicz
% sygna³ b³êdu d jako:
% d(n) = 1*x_ref(n)+b(2)x_ref(n-1)+b(3)x_ref(n-2)+ .... + b(P)x_ref(n-P+1)
% Miejsce na Twój kod:
b = [ 1 -1 ];
d = filter(b, 1, x_ref);


%%
% Prezentacja sygna³u i sygna³u b³êdu:
figure(1); 
subplot(2,1,1); plot(x_ref); title('x_{ref} - Sygna³ oryginalny');
subplot(2,1,2); plot(d); title('d - Sygna³ b³êdu');

%Obliczenie entropii sygna³u b³êdu i sygna³u wejœciowego
%(normalizacja dodana dla poprawnego dzia³ania funkcji entropy)
entropy_x = entropy(x_ref/max(abs(x_ref))); 
entropy_d = entropy(d/max(abs(d)));

disp(['Entropia sygna³u wejœciowego: ' num2str(entropy_x)]);
disp(['Entropia sygna³u b³êdu: ' num2str(entropy_d)]);

save('d.mat','d');  % zapis wyjœciowego 
save('b.mat','b');
save('x_ref.mat','x_ref');
