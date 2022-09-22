%ALGORÍMTOMO PARA ENCONTRAR O ESPECTOGRAMA PARA Pc3

clear all
close all
clc
x=load('dadofiltbel');
f=1;
window=182;
noverlap=180;
nfft=3601;
%subplot(4,1,1)
spectrogram(x,window,noverlap,nfft,f,'yaxis')
colormap(jet)
%xlim([0 23])

