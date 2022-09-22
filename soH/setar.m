% UTILIZOU-SE PARA SETAR O ARQUIVO E SALVAR EM TXT PRA PASSAR O FILTRO


clear all
close all
clc
cd     'C:\Users\Wendell Nobre\Desktop\Corona TCC\Dados das estações\Nacionais\Tatuoca\variação ttb\soH'
mkdir setados
lista=dir('*.txt');
arq=char(lista.name);
dirout= 'C:\Users\Wendell Nobre\Desktop\Corona TCC\Dados das estações\Nacionais\Tatuoca\variação ttb\soH\setados\';
  p=load('20180826 (11).txt');  
p(p>26700 | p<26000)= nanmean(p);








dlmwrite([dirout '0826.txt'],p,'precision','%.5f');