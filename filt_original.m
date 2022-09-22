


%EVENTO DA TEMPESTADE 25/08/2018
%Programa para encontrar frequencias de e espectro dinamico Pc3 e Pc4
% Por Wendell Nobre, 2019 addaptado de Amanda Piasse, 2017.

%*****************************  KOUROU   **********************************
close all
clear 
clc

cd '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/Kourou/Dados em segundos/convertido';


a1=load('0826.txt'); 
%=nanmean(xp)-xp;
n0=input('digite a Pc que você quer  ');
 
if n0==3
    s= '********** Você está usando o filtro Pc3 ****************';
    disp(s)
    T1=40; T2=45; %períodos da pc3. Tive que diminuir o período para facilitar a visualização da pulsações no spectrogram!!!
    f1=20; f2=50;
    j1=181  ;j2=180;

elseif n0==5
    
    T1=150; T2=600;%per�odos da pc5
    f1=2; f2=7;
    
elseif n0==4
    s= '********** Você está usando o filtro Pc4 ****************';
    uy='                                                     ';
    disp(s);disp(uy)
    T1=80; T2=100;
    f1=6; f2=23;
    j1=181  ; j2=180;
end
hr1=input('Digite a hora inicial '); 

i=input('Digite o intervalo de tempo '); %valores pequenos, onde ser�o somados a hr1

w=[2/T2 2/T1]; % frequencia normalizada   / normalizo a frequencia
h=fdesign.bandpass('N,F3db1,F3db2',8,w(1),w(2)); %$ FILTRO O DADO .. 
d1 = design(h,'butter');
hr2=hr1+i; %hr2 limita o intervalo da leitura


 t=[1:86400]/3600;
 t1=t(hr1*3600+1:hr2*3600);    
h1=a1(hr1*3600+1:hr2*3600);
out=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);
%d1.sosMatrix
 save('dadokou26','out','-ascii')
 figure (1)
 pop=load('dadokou26');subplot(4,2,3);plot(t1,pop);ylim([-0.2 0.2]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Kourou')
 
%++++++++++++++++++++++++++++++  TATUOCA  +++++++++++++++++++++++++++++++++

cd '/home/wendell/Desktop/Corona TCC/Dados das estações/Nacionais/ttb'


tr=load('TTB0_20180826second.mat'); 
 a2=tr.X;
h2=a2(hr1*3600+1:hr2*3600);
out1=filtfilt(d1.sosMatrix,d1.ScaleValues,h2);
%d1.sosMatrix
 save('dadottb','out1','-ascii')
 pop1=load('dadottb');subplot(4,2,7);plot(t1,pop1);ylim([-0.2 0.2]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Tatuoca')
 %++++++++++++++++++++++++  SAN JUAN  +++++++++++++++++++++++++++++++++++++
 
 cd '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/San juan'
 

 a3=load('sjg0826.txt'); 
     
h3=a3(hr1*3600+1:hr2*3600);
out2=filtfilt(d1.sosMatrix,d1.ScaleValues,h3);
%d1.sosMatrix
 save('dadocba','out2','-ascii')
 poper2=load('dadocba');subplot(4,2,1);plot(t1,poper2);ylim([-0.2 0.2]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Cuiabá')
 
 %++++++++++++++++++++++++ ARAGUATÍNS +++++++++++++++++++++++++++++++++++++
 cd  '/home/wendell/Desktop/Corona TCC/Dados das estações/Araguatins/dia26/soH'
 
 a4=load('260818.txt'); 
     
h4=a4(hr1*3600+1:hr2*3600);
out3=filtfilt(d1.sosMatrix,d1.ScaleValues,h4);
%d1.sosMatrix
 save('dadoara253k','out3','-ascii')
 poper3=load('dadoara253k');subplot(4,2,5);plot(t1,poper3);ylim([-0.2 0.2]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Araguatíns')
 
 
%##########################################################################
%##################### ESPECTROGRAMA Pc3 ##################################
%##########################################################################

%*********************** KOU **********************************************

if n0==3
x=out;
window= 500;
noverlap=499;
nfft=3600;
fs=1;
[s,f,t1] = spectrogram(x,window,noverlap,nfft,fs);
subplot(4,2,4)
%x=abs(x)
spectrogram(x,window,noverlap,nfft,fs,'yaxis');
ylim([15 35])
caxis([-30 0])
map=jet(70);
colormap(map)

%********************* TTB  ***********************************************
x1=out1;
[s1,f1,t2] = spectrogram(x1,window,noverlap,nfft,fs);
subplot(4,2,8)
spectrogram(x1,window,noverlap,nfft,fs,'yaxis');
ylim([15 35])
caxis([-30 0])
colormap(map)

%*******************  SAN *************************************************
x2=out2;
[s2,f2,t3] = spectrogram(x2,window,noverlap,nfft,fs);
subplot(4,2,2)
spectrogram(x2,window,noverlap,nfft,fs,'yaxis');
ylim([15 35])
caxis([-30 0])
colormap(map)
%************************ ARA  ********************************************
x2=out3;
[s2,f2,t3] = spectrogram(x2,window,noverlap,nfft,fs);
subplot(4,2,6)
spectrogram(x2,window,noverlap,nfft,fs,'yaxis');
ylim([15 35])
caxis([-30 0])
colormap(map)


%##########################################################################
%################## ESPECTROGRAMA PC4 #####################################
%##########################################################################

elseif n0==4
x=out;
window= 500;
noverlap=499;
nfft=3600;
fs=1;
[s,f,to] = spectrogram(x,window,noverlap,nfft,fs);
subplot(4,2,4)
spectrogram(x,window,noverlap,nfft,fs,'yaxis');
ylim([0 60])
colormap jet
%**************************************************************************
x1=out1;
[s1,f1,t2] = spectrogram(x1,window,noverlap,nfft,fs);
subplot(4,2,2)
spectrogram(x1,window,noverlap,nfft,fs,'yaxis');
ylim([0 60])
colormap jet

%**************************************************************************
x2=out2;
[s2,f2,t3] = spectrogram(x2,window,noverlap,nfft,fs);
subplot(4,2,6)
spectrogram(x2,window,noverlap,nfft,fs,'yaxis');
ylim([0 60])
colormap jet
%**************************************************************************
x3=out3;
[s2,f2,t3] = spectrogram(x3,window,noverlap,nfft,fs);
subplot(4,2,8)
spectrogram(x3,window,noverlap,nfft,fs,'yaxis');
ylim([0 60])
colormap jet

end
 
