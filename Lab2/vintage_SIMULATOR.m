%---------------------------------------------------------------
% Prezentacja zjawiska aliasingu
%                Marcin Witkowski, 2018-03-14

clear all;
close all;
k = 10;
[data, fs] = audioread('loop.wav');


sig_orig = data(:,1);
%sygnal probkowany poprawnie
f1 = figure;

spectrogram(sig_orig,100,80,100, fs,'yaxis');
title(['1. Sygna³ próbkowany z czêstotliwoœci¹ ' num2str(fs) 'Hz']);
p1 = audioplayer(sig_orig,fs);
uicontrol('Style', 'pushbutton','String', 'Play',...
    'Callback', 'play(p1)',  'Position', [10 10 50 20]);
uicontrol('Style', 'pushbutton','String', 'Stop',...
    'Callback', 'stop(p1)',  'Position', [60 10 50 20]);

%sygnal probkowany z czêstotliwoscia k razy mniejsza
sig_ds = sig_orig(1:k:end);
f2 = figure; spectrogram(sig_ds, 100,80,100, fs/k,'yaxis');
title(['2. Sygna³ próbkowany z czêstotliwoœci¹ ' num2str(fs/k) 'Hz']);
p2 = audioplayer(sig_ds,fs/k);
uicontrol('Style', 'pushbutton','String', 'Play',...
    'Callback', 'play(p2)',  'Position', [10 10 50 20]);
uicontrol('Style', 'pushbutton','String', 'Stop',...
    'Callback', 'stop(p2)',  'Position', [60 10 50 20]);

%filtracja:
f = [0 1/k 1/k 1]; m = [1 1 0 0];
b = fir2(100,f,m);
f3 = figure;freqz(b);title('Charakterystyka filtra')
sig_orig_f = filter(b,1,sig_orig);

%sygnal po filtracji probkowany z fs i fs/k
f4 = figure; spectrogram(sig_orig_f(1:end), 100,80,100, fs,'yaxis');
title(['3. Sygna³ po filtracji próbkowany z czêstotliwoœci¹ ' num2str(fs) 'Hz']);
p3 = audioplayer(sig_orig_f,fs);
uicontrol('Style', 'pushbutton','String', 'Play',...
    'Callback', 'play(p3)',  'Position', [10 10 50 20]);
uicontrol('Style', 'pushbutton','String', 'Stop',...
    'Callback', 'stop(p3)',  'Position', [60 10 50 20]);

sig_ds_f = sig_orig_f(1:k:end);
f5 = figure; spectrogram(sig_ds_f, 100,80,100, fs/k,'yaxis');
title(['4. Sygna³ po filtracji próbkowany z czêstotliwoœci¹ ' num2str(fs/k) 'Hz']);
p4 = audioplayer(sig_ds_f,fs/k);
uicontrol('Style', 'pushbutton','String', 'Play',...
    'Callback', 'play(p4)',  'Position', [10 10 50 20]);
uicontrol('Style', 'pushbutton','String', 'Stop',...
    'Callback', 'stop(p4)',  'Position', [60 10 50 20]);

figs = [f1, f2, f4, f5];
nfig = length(figs);
frac = 1/nfig;
screensize = get( groot, 'Screensize' );
for K = 1 : nfig
  old_pos = get(figs(K), 'Position');
  set(figs(K), 'Position', [(K-1)*frac*screensize(3), old_pos(2), frac*screensize(3), old_pos(4)]);
end