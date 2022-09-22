%EVENTO Pr� TEMPESTADE
%Evento de pc3 no dia 25/08/2018


close all
clear 
clc

a1=load('0825.txt'); 
%=nanmean(xp)-xp;

hr1=input('Digite a hora inicial '); 

i=input('Digite o intervalo de tempo '); %valores pequenos, onde ser�o somados a hr1

% n0 define o tipo de pulsa��o que eu quero :  Pc3, Pc4 ou Pc5
%hr1 � a hora inicial
% i � o intervalo de tempo que quero (tive que dividir em intervalos cada vez menores
% mes e dia s�o os meses o dia e a esta��o que eu utilizava (isso vai depender dos seus dados) 
n0=input('digite a Pc que voc� quer  ');
if n0==3
    
    T1=35; T2=45;%per�odos da pc3
    f1=33.3; f2=100;
    j1=181  ;j2=180;

elseif n0==5
    
    T1=150; T2=600;%per�odos da pc3
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
 save('dadokou25','out','-ascii')
 figure (1)
 pop=load('dadokou25');subplot(2,1,1);plot(t1,pop);%ylim([-0.1 0.1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('KOU')
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cd 'home/wendell/Desktop/Corona TCC/Dados das estações/soH'

a2=load('20180825 (10).txt'); 
     
h2=a2(hr1*3600+1:hr2*3600);
out1=filtfilt(d1.sosMatrix,d1.ScaleValues,h2);
%d1.sosMatrix
 save('dadokou25+1','out1','-ascii')
 pop1=load('dadokou25+1');subplot(2,1,2);plot(t1,pop1);%ylim([-0.1 0.1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('TTB')
