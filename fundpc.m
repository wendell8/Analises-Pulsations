close all
clear
clc
cho=input('Para uma estação digite 1 (precisa escolher antes),  para outras estações digite 0 ? ');
if cho == 1
    
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

 
 %########################################################################
 %#########################    ESTAÇÕES     ##############################
 %########################################################################
elseif cho == 0
    
n0=input('digite a Pc que voce quer  ');

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
hr1=input('Digite a hora inicial ');

i=input('Digite o intervalo de tempo ');
hr2=hr1+i;
w=[2/T2 2/T1]; % frequencia normalizada   / normalizo a frequencia
h=fdesign.bandpass('N,F3db1,F3db2',8,w(1),w(2)); %$ FILTRO O DADO .. 
d1 = design(h,'butter');
 t=[1:86400]/3600;
 t1=t(hr1*3600+1:hr2*3600);
 time=datetime(2018,08,25) + seconds(1:86400);
 
 %++++++++++++++++++++++++++++++  TATUOCA  +++++++++++++++++++++++++++++++++
cd  '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/ttb/dia 27'
tere=load('TTB0_20180827second.mat'); 
a1=tere.X;
h1=a1(hr1*3600+1:hr2*3600);
outttb=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);
%d1.sosMatrix
 save('ttb','outttb','-ascii')
 pop1=load('ttb');plot(t1,pop1);subplot(512);ylim([-0.2 0.2]);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Tatuoca')
 
 %######################### KOUROU ########################################
 
 cd  '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/kou/dia 27'
 
 m2=load('kou0827.txt'); 
 h3=m2(hr1*3600+1:hr2*3600);
 out=filtfilt(d1.sosMatrix,d1.ScaleValues,h3);
%d1.sosMatrix
 save('kou','out','-ascii')
 poper4=load('kou');subplot(512);plot(t1,poper4);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Kourou')
 %######################## ARAGUATINS #####################################
 
 cd '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/ara/dia 27'
 m3=load('ara2708.txt');
 h4=m3(hr1*3600+1:hr2*3600);
 out2=filtfilt(d1.sosMatrix,d1.ScaleValues,h4);
%d1.sosMatrix
 save('ara','out2','-ascii')
 poper5=load('ara');subplot(514);plot(t1,poper5);
 xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('Araguatins')
 
%##################### São José dos Campos ###############################
 
 cd  '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/sjz/dia 27'
s1=load('dia27.txt'); 
h5=s1(hr1*3600+1:hr2*3600);
out3=filtfilt(d1.sosMatrix,d1.ScaleValues,h5);
%d1.sosMatrix
save('sjc','out3','-ascii')
pop3=load('sjc');plot(t1,pop3);subplot(515);%ylim([-0.2 0.2]);
xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('SJC')
 
%################### San Juan ############################################
cd '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/sjg/dia 27'
s2=load('sjg0827.txt'); 
h6=s2(hr1*3600+1:hr2*3600);
out4=filtfilt(d1.sosMatrix,d1.ScaleValues,h6);
save('sjg','out4','-ascii')
pop4=load('sjg');plot(t1,pop4);subplot(511);%ylim([-0.2 0.2]);
xlabel('Horas UT');ylabel('Amplitude nT');grid on;title('SJG')
 
end