close all
clear
clc
cd '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/Kourou/Dados em segundos' 
a1=load('0825.txt'); 
%=nanmean(xp)-xp;
n0=input('digite a Pc que voce quer  ');

% n0 define o tipo de pulsa��o que eu quero :  Pc3, Pc4 ou Pc5
%hr1 � a hora inicial
% i � o intervalo de tempo que quero (tive que dividir em intervalos cada vez menores
% mes e dia s�o os meses o dia e a esta��o que eu utilizava (isso vai depender dos seus dados) 
if n0==3
    s= '********** Você está filtrando Pc3 ****************';
    disp(s)
    T1=35; T2=45;%per�odos da pc3
    f1=33.3; f2=100;
    j1=181  ;j2=180;

elseif n0==5
    
    T1=150; T2=600;%per�odos da pc3
    f1=2; f2=7;
    
elseif n0==4
    s= '********** Você está filtrando Pc4 ****************';
    uy='                                                     ';
    disp(s);disp(uy)
    T1=80; T2=100;
    f1=6; f2=23;
    j1=181  ; j2=180;
end

w=[2/T2 2/T1]; % frequencia normalizada   / normalizo a frequencia
h=fdesign.bandpass('N,F3db1,F3db2',8,w(1),w(2)); %$ FILTRO O DADO .. 
d1 = design(h,'butter');
out=filtfilt(d1.sosMatrix,d1.ScaleValues,a1);
%d1.sosMatrix
 save('dadokou25','out','-ascii')
 time=datetime(2018,08,25) + seconds(1:86400);
 figure (1)
 pop=load('dadokou25');subplot(5,1,2);plot(time,pop);%ylim([-1 1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Kourou')

%############################## Tatu�ca ###################################

cd '/home/wendell/Downloads/ttb'
tr=load('TTB0_20180825second.mat');
a2=tr.X;
%isnan ([a2 NaN])= nanmean(a2);
out1=filtfilt(d1.sosMatrix,d1.ScaleValues,a2);
%d1.sosMatrix
 save('dadottb24','out1','-ascii')
 pop1=load('dadottb24');subplot(5,1,1);plot(time,pop1);%ylim([-1 1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Tatuoca dia 24')
 
 %########################## San Juan #####################################
 
 cd    '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/San juan';
a3=load('sjg0825.txt'); 
 out2=filtfilt(d1.sosMatrix,d1.ScaleValues,a3);
%d1.sosMatrix
 save('dadokou253k','out2','-ascii')
 poper2=load('dadokou253k');subplot(5,1,3);plot(time,poper2);%ylim([- 1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('San Juan')
 
%#################### Araguatins ##########################################
cd '/home/wendell/Downloads/Araguatins/soH';
 a4=load('250818.txt'); 
 out3=filtfilt(d1.sosMatrix,d1.ScaleValues,a4);
%d1.sosMatrix
 save('dadoara253k','out3','-ascii')
 poper4=load('dadoara253k');subplot(5,1,4);plot(time,poper4);%ylim([- 1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Araguatins')
 
 %#########################################################################
 cd '/home/wendell/Downloads/sao luiz/dia25/soH'
 a5=load('slz250818.txt'); 
 out4=filtfilt(d1.sosMatrix,d1.ScaleValues,a5);
%d1.sosMatrix
 save('dadoslz25','out4','-ascii')
 poper4=load('dadoslz25');subplot(5,1,5);plot(time,poper4);%ylim([- 1]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('São Luiz')
 
 
 