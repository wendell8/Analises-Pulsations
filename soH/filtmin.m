close all
clear 
clc

a1=load('20180825 (10).txt'); 
%a1=nanmean(xp)-xp;

hr1=input('Digite a hora inicial '); 

i=input('Digite o intervalo de tempo '); %valores pequenos, onde serï¿½o somados a hr1

% n0 define o tipo de pulsaï¿½ï¿½o que eu quero :  Pc3, Pc4 ou Pc5
%hr1 ï¿½ a hora inicial
% i ï¿½ o intervalo de tempo que quero (tive que dividir em intervalos cada vez menores
% mes e dia sï¿½o os meses o dia e a estaï¿½ï¿½o que eu utilizava (isso vai depender dos seus dados) 
n0=input('digite a Pc que você quer  ');
if n0==3
    
    T1=35; T2=45;%perï¿½odos da pc3
    f1=33.3; f2=100;
    j1=181  ;j2=180;

elseif n0==5
    
    T1=150; T2=600;%perï¿½odos da pc3
    f1=2; f2=7;
    
elseif n0==4
    T1=45; T2=100;
    f1=6; f2=23;
    j1=181  ; j2=180;
end


w=[2/T2 2/T1]; % frequencia normalizada   / normalizo a frequencia
h=fdesign.bandpass('N,F3db1,F3db2',8,w(1),w(2)); %$ FILTRO O DADO .. 
d1 = design(h,'butter');
hr2=hr1+i; %hr2 limita o intervalo da leitura


 t=[1:86400]/3600;
 t1=t(hr1*3600+1:hr2*3600);
     
h1=a1(hr1*3600+1:hr2*3600);
out=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);
%d1.sosMatrix
 save('dadokou27','out','-ascii')
 figure (1)
 pop=load('dadokou27');subplot(2,1,1);plot(t1,pop);%ylim([-0.1 0.1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on
 %++++++++++++++++++  Espectrogram   ++++++++++++++++++++++++++++++++++++++
% pc=input('0 para Pc3 e 1 Pc4 ');
 %if pc==0
     x=out;
window= 190;
noverlap=189;

nfft=3600;
fs=1;
[s,f,to] = spectrogram(x,window,noverlap,nfft,fs);
subplot(2,1,2)
spectrogram(x,window,noverlap,nfft,fs,'yaxis');
ylim([0 60])
colormap jet
