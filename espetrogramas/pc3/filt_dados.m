
close all
clear 
clc
cd  '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/Kourou/Dados em segundos/convertido'

a1=load('0826.txt'); 

hr1=input('Digite a hora inicial '); 

i=input('Digite o intervalo de tempo '); %valores pequenos, onde ser�o somados a hr1

% n0 define o tipo de pulsa��o que eu quero :  Pc3, Pc4 ou Pc5
%hr1 � a hora inicial
% i � o intervalo de tempo que quero (tive que dividir em intervalos cada vez menores
% mes e dia s�o os meses o dia e a esta��o que eu utilizava (isso vai depender dos seus dados) 
n0=input('digite a Pc que voc� quer  ');
if n0==3
    
    T1=10; T2=45;%per�odos da pc3
    f1=0; f2=60;
    j1=181  ;j2=180;

elseif n0==5
    
    T1=150; T2=600;%per�odos da pc3
    f1=2; f2=7;
    
elseif n0==4
    T1=45; T2=150;
    f1=6; f2=23;
    j1=181  ; j2=180;
end


w=[2/T2 2/T1]; % frequencia normalizada   / normalizo a frequencia
h=fdesign.bandpass('N,Fc1,Fc2',8,w(1),w(2)); %$ FILTRO O DADO .. 
d1 = design(h,'butter');
hr2=hr1+i; %hr2 limita o intervalo da leitura
fs=1e-3;
 %n=1*2;
 t=[1:86400]/3600;
 t1=t(hr1*3600+1:hr2*3600+1);
 
 %if mes==1
    %mes1=['janeiro'];
%elseif mes==2
    %mes1=['fevereiro'];
%elseif mes==03
    %mes1=['mar�o'];
%elseif mes==04
    %mes1=['abril'];
%elseif mes==05
    %mes1=['maio']
%elseif mes==06  
    %mes1=['junho'];
%elseif mes==07
    %mes1=['julho'];
%elseif mes==08
    %mes1=['agosto'];
%elseif mes==09
    %mes1=['setembro']
%elseif mes==10
    %mes1=['outubro']
%elseif mes==11
    %mes1=['novembro'];
%elseif mes==12
    %mes1=['dezembro']
%end


%estaca01
   % estacao11='Kourou';
     
h1=a1(hr1*3600+1:hr2*3600);
out=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);



 save('dadofiltkou','out' ,'-ascii');
 
 
 
 subplot(4,1,1);pop=load('dadofiltkou'); plot(pop)