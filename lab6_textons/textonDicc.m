
%Este archivo se utiliza dentro del directorio de train para calcular el
%diccionario de textones, se guarda la matriz de nombre textones como el
%archivo textons25cat.mat



addpath('lib')
addpath('train')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;


% imagen de referencia para construir diccionario de textones


T = 'T0';
im = [];
for j = 1:25
    if (j>=10)
        T = 'T';
    end
    
     st = strcat(T,num2str(j),'_01.jpg'); 
     st2 = strcat(T,num2str(j),'_02.jpg');
     if exist(st,'file')
         im1 = double(imread(st))/255;         
     elseif exist(st2,'file')
         im1 = double(imread(st2))/255;
     else
         st = strcat(T,num2str(j),'_03.jpg');
         im1 = double(imread(st))/255;
     end 
        
     im = cat(2,im,im1);     
end

% numero de textones en diccionario
k = 50;

% diccionario de textones
[map,textons] = computeTextons1(fbRun(fb,im),k);   %Se obtiene el archivo textons25cat.mat se utiliza la funcion computeTextons1
save('textons25cat','textons')




