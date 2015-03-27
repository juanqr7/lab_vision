addpath('lib')
addpath('train')
addpath('test')
close all;clc;clear all;

load('textons25cat')

% create filter bank
[fb] = fbCreate;
k = 50;

D=dir('*.jpg');


%..... Algoritmo utilizado para obtener los histogramas de las 250 imagenes de test, se debe usar dentro de la carpeta test. Se obtiene el archivo TestHistograms.mat

for y=1:numel(D),                                         
    im2=double(imread(D(y).name))/255;
    tmap = assignTextons(fbRun(fb,im2),textons'); 
    a = fbRun(fb,im2);
    
    H1(:,y)=histc(tmap(:),1:k)/numel(tmap);
end

save('TestHistograms','H1')