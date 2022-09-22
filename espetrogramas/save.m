%1º passo ----SEPARAÇÃO-----
close all
clear 
clc
cd   '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/Kourou/Dados em segundos/convertido'

p=load('0826.txt');

for i=0:length(p)
    hr1=input('Digite a hora inicial ');
   in=input('Digite o intervalo de tempo ');
    n0=input('digite a Pc que você quer  ');
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
%hr2 limita o intervalo da leitura
fs=1;
 %n=1*2;
 hr2=hr1+in;
 t=[1:86400]/3600;
 t1=t(hr1*3600+1:hr2*3600+1);
 
 h1=p(hr1*3600+1:hr2*3600);
 pop=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);
 
 plot(pop)
  
esc=input('É de interesse, então salva (1) se não (0) ');

if esc==1
    
    out=filtfilt(d1.sosMatrix,d1.ScaleValues,h1);
    save('dadofiltkou','out' ,'-ascii');
    break
elseif esc==0
    continue
end  
end
   