
%EVENTO PÓS TEMPESTADE
%Evento de pc3 no dia 27/08/2018 [4 às 4.30]


close all
clear 
clc

a1=load('0827.txt'); 
%=nanmean(xp)-xp;

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
window= 181;
noverlap=180;

nfft=3601;
fs=1;
[s,f,to] = spectrogram(x,window,noverlap,nfft,fs);
subplot(2,1,2)
spectrogram(x,window,noverlap,nfft,fs,'yaxis');
ylim([0 60])
colormap jet

 %elseif pc==1
 %    x=out;
%window= 500;
%noverlap=499;
%nfft=3601;
%fs=1;
%[s,f,to] = spectrogram(x,window,noverlap,nfft,fs);
%subplot(2,1,2)
%spectrogram(x,window,noverlap,nfft,fs,'yaxis');
%ylim([0 50])
%colormap jet
 %elseif pc==2
     
% end
     




%************************************************************************
%figure(2)
%p1=load('dadokou'); 

% n0 define o tipo de pulsaï¿½ï¿½o que eu quero :  Pc3, Pc4 ou Pc5
%hr1 ï¿½ a hora inicial
% i ï¿½ o intervalo de tempo que quero (tive que dividir em intervalos cada vez menores
% mes e dia sï¿½o os meses o dia e a estaï¿½ï¿½o que eu utilizava (isso vai depender dos seus dados) 
%n0=input('digite a Pc que vocï¿½ quer  ');
%if n0==3
    
 %   T1=10; T2=45;%perï¿½odos da pc3
 %  f1=0; f2=60;
   % j1=181  ;j2=180;
%
%elseif n0==5
    
 %   T1=150; T2=600;%perï¿½odos da pc3
  %  f1=2; f2=7;
    
%elseif n0==4
 %   T1=45; T2=150;
  %  f1=6; f2=23;
   % j1=181  ; j2=180;
%end


%w=[2/T2 2/T1]; % frequencia normalizada   / normalizo a frequencia
%h=fdesign.bandpass('N,Fc1,Fc2',8,w(1),w(2)); %$ FILTRO O DADO .. 
%d1 = design(h,'butter');

%sai=filtfilt(d1.sosMatrix,d1.ScaleValues,p1);


 %save('dadokou2','sai' ,'-ascii')
 %pop=load('dadokou2');subplot(4,1,2); plot(t1,pop);
% grid on; xlabel('Horas UT');ylabel('Amplitude nT');title(' dadoskou2')
 
%x2=load('dadokou2');
%window2=length(x2)./1;
%noverlap2=[ ];
%nfft2=length(x2);
%fs=1e-2;
%[s2,f3,t2] = spectrogram(x2,window2,noverlap2,nfft2,fs);
%subplot(4,1,4)
%spectrogram(x2,window2,noverlap2,nfft2,fs,'yaxis');
%colormap jet

%###########################################################################