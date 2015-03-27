addpath('lib')
addpath('train')
addpath('test')
close all;clc;clear all;

load('textons25cat.mat')
load('TrainHistograms.mat')
load('TestHistograms')

% create filter bank
[fb] = fbCreate;
k = 50;

D=dir('*.jpg');

si = size(H2);

tic

for y=1:numel(D),                   %en vez de numel(D) se cambia por 750 para comparar con la base de entrenamiento   
        for ii = 1:50
            if H1(ii,y) == 0
                H1(ii,y) = 10e-7;
            end 
        end
        
        for ii = 1:si(1)
            for jj = 1:si(2)
                if H2(ii,jj) == 0
                    H2(ii,jj) = 10e-7;                     %De tener valores de 0 en los histogramas se pueden encontrar errores en el cálculo de chi-cuadrado, se cambian los valores por 10e-7
                end
            end
        end
        
        for j=1:si(2)            
        chi(j) = sum(((H1(:,y)-H2(:,j)).^2)./H2(:,j));     %Se calcula la distancia 'chi-square' entre la imagen test de entrada y todos los histogramas de entrenamiento. Para comparar con la base de entrenamiento se cambia H1 por H2
        end
        [m,idx]=min(chi);
        categ(y) = (ceil(idx/30));
    
     
end

categoryM_NN = reshape(categ',10,25)';  %en vez de 10 se cambia por 30 para comparar con la base de entrenamiento

for i=1:25,frec4(i,:) = (histc(categoryM_NN(i,:),1:25).*10);end     %en vez de 10 se cambia por (100/30) para comparar con la base de entrenamiento    

toc

imagesc(frec4)
title(sprintf('Confusion matrix (%.2f %% accuracy)',mean(diag(frec4)) ))






  