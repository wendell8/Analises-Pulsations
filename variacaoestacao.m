clear
close all
clc
 cd     '/home/wendell/Desktop/Corona TCC/Dados das estações/Nacionais/Tatuoca/variação ttb/Dados td por fora/soH'
q=load('20180825 (10).txt');w=load('20180826 (11).txt');e=load('20180827 (12).txt');
ttb=cat(1,q,w,e);
m1=nanmean(ttb)-ttb;
%#######################----KOU----########################################
 cd     '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/kou/dia 25'
r=load('0825.txt');
cd     '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/Kourou/Dados em segundos/convertido'

t=load('0826.txt');
cd     '/home/wendell/Desktop/Corona TCC/Dados das estações/Evento Pos sst'
y=load('0827.txt');

kou=cat(1,r,t,y);

m2=nanmean(kou)-kou;
%###################----SJG-----###########################################
cd '/home/wendell/Desktop/Corona TCC/Dados das estações/Internacionais/San juan'
u=load('sjg0825.txt');to=load('sjg0826.txt');tu=load('sjg0827.txt');
sjg=cat(1,u,to,tu);
m3=nanmean(sjg)-sjg;
ted=cat(2,m1,m2,m3);

 t = datetime(2018,8,26) + seconds(1:259200);
 
 plot(t,ted);grid on;title('Variação Diurna dos dias 26 à 28/08/2018');
legend('TTB','KOU','SJG');
ylabel('Amplitudes em nT');xlabel('Mês-Dia-HoraUT');
%#################### ARA #################################################
cd '/home/wendell/Desktop/Corona TCC/Dados das estações/Araguatins/soH'

u=load('250818.txt');i=load('260818.txt');o=load('270818.txt');
ara=cat(1,u,i,o);
m4=nanmean(ara)-ara;

% %########################## SJC ###########################################
% 
% cd '/home/wendell/Desktop/Corona TCC/Dados das estações/sst alta/sjz'
% 
% 
% ti=load('dia25.txt');to=load('dia26.txt');tu=load('dia27.txt');
% sjc=cat(1,ti,to,tu);
% mqw=nanmean(sjc)-sjc;
% m5=mqw*10e-2;
% %##########################################################################
% ted=cat(2,m1,m2,m3,m4,m5);
% 
%  t = datetime(2018,8,26) + seconds(1:259200);
%  
%  plot(t,ted);grid on;title('Variação Diurna dos dias 26 à 28/08/2018');
% legend({'TTB','KOU','SJG','ARA', 'SJC'},'Location','southeast');
% ylabel('Amplitudes em nT');xlabel('Mês-Dia-HoraUT');

%##########################################################################
