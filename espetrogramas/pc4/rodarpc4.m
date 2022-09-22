%PLOTAR TODAS AS ESTAÇÕES
q=load('dadofiltpc4ara');
w=load('dadofiltpc4belem');
w(w>0.2 | w< -0.2)=NaN; %tira os ruidos antes do plot
e=load('dadofiltpc4SLZ');
r=load('dadofiltpc4kou');
t=load('dadofiltpc4hou');
subplot(5,1,1);
plot(q); grid on
title('Araguatins');

subplot(5,1,2);
plot(w); grid on
title('Tatuoca');
xlim([0 4500]);

subplot(5,1,3);
plot(e); grid on
title('São Luis');

subplot(5,1,4);
plot(r); grid on
title('Kourou');

subplot(5,1,5);
plot(t); grid on
title('Hoakanyo');