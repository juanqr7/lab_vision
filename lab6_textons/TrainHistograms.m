addpath('lib')
addpath('train')
addpath('test')
close all;clc;clear all;

load('textons25cat')

% create filter bank
[fb] = fbCreate;
k = 50;

D=dir('*.jpg');


% ..... Algoritmo utilizado para obtener los histogramas de las 750
% imagenes de entrenamiento, se debe usar dentro de la carpeta train. Se
% obtiene el archivo TrainHistograms.mat, el archivo TrainHistograms.mat
% debe copiarse en la carpeta de test
H2 = zeros(50,750);

for i=1:numel(D),                                         
    im2=double(imread(D(i).name))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');                
    a = fbRun(fb,im2);
    H2(:,i)=histc(tmap(:),1:k)/numel(tmap);
    i   
end

save('TrainHistograms','H2')