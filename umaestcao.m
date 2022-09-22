close all
clear
clc

    cd  '/home/wendell/Downloads/sao luiz/dia25/soH'

    a1=load('slz250818.txt'); 
   % a1=tere.X;
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
h1=a1(hr1*3600+1:hr2*3600);
out1=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);
%d1.sosMatrix
 save('dadottb','out1','-ascii')
 pop1=load('dadottb');plot(t1,pop1);title('São Luiz dia 25 ');grid on;%ylim([-0.5 0.5]);
 