%
%===============================================
%DESCRIÃ‡ÃƒO:
%O programa em questÃ£o lÃª 3 dias de valores da projeÃ§Ã£o horizontal do campo
%geomagnÃ©tico, mostra seu espectro de amplitude e filtra somente as
%pulsaÃ§Ãµes Pc3
%
%Programador: Raphael Di Carlo
%Data: 12/09/2019
%VersÃ£o: 1.0
%


%------------------------------------------------
%---------------ESTAÃ‡ÃƒO DE ARAGUAÃ?NA-------------
%cd     'C:\Users\Wendell Nobre\Desktop\Corona TCC\Dados das estações\Internacionais\HOA\Comp H 2018';
close all
clear all
clc
%=load('0825.txt');
a=load('20180826 (11).txt');
%H3=load('0827.txt');
%a=cat(1,H1,H2);  %Concatena todos os dados dos 3 dias
a(a>26500 | a<26300)= 26400;
%m=nanmean(p);
%a=m-p;
%=(o-a)*10000; %uso do 10000 somente para estações do EMBRACE
for ig=0:1440:length(a)-1440
    h=[a;nanmean(a(ig+1:ig+1440))];
end
dt=24./length(h);  %Tempo dividido em 72h (3 dias)
T(1)=dt;
freq(1)=1/dt;
adft=fft(h);  %Transformada de Fourier do dado
ampl(1)=0.01;

for i=2:length(h)
    T(i)=dt+T(i-1);
    freq(i)=1/T(i);
    ampl(i)=abs(adft(i));  %Espectro de amplitude do dado
end
esc=input('Digite 3 para Pc3 e 4 para Pc4  ' );
if esc==3
ampl=ampl.';
plot(T,h,'g'); grid on;
xlabel('Tempo(Horas)');
ylabel('Projeção Horizontal H (nT)');
title('Estação Araguatins');
figure
plot(T,ampl);
xlim([4 40]); 
xlabel('Tempo(Horas)');
ylabel('Amplitude (nT)');
title('Espectro de Amplitude');
Pc=[10 45]; %Intervalo de tempo das pulsaÃ§Ãµes Pc3
h1=fdesign.bandpass('N,Fc1,Fc2',8,2/Pc(2),2/Pc(1)); % Filtro Butterwoth
d1 = design(h1,'butter');
f=filter(d1,ampl);
figure
plot(T,f);
xlim([3 39])
xlabel('Tempo(Horas)');
ylabel('Amplitude(nT)');
title('Pc3');
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
else
    esc=4;
ampl=ampl.';
plot(T,a,'g'); grid on;
xlabel('Tempo(Horas)');
ylabel('Projeção Horizontal H (nT)');
title('Estação');
figure
plot(T,ampl);
xlim([6 65]); %setar  conforme o seguimento de tempo
xlabel('Tempo(Horas)');
ylabel('Amplitude (nT)');
title('Espectro de Amplitude');
  
Pc=[45 150]; %Intervalo de tempo das pulsaÃ§Ãµes Pc4
h1=fdesign.bandpass('N,Fc1,Fc2',8,2/Pc(2),2/Pc(1)); % Filtro Butterwoth
d1 = design(h1,'butter');
f=filter(d1,ampl);
figure
plot(T,f);
xlim([3 70])
xlabel('Tempo(Horas)');
ylabel('Amplitude(nT)');
title('Pc4');

end


out=filtfilt(d1.sosMatrix,d1.ScaleValues,a);
save('dadofiltpc3_1d','out' ,'-ascii');

