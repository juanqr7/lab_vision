addpath('lib')
addpath('train')
addpath('test')
close all;clc;%clear all;

load('textons25cat.mat')
load('TrainHistograms.mat')
load('TestHistograms')

% create filter bank
[fb] = fbCreate;
k = 50;
newH1 = H1';
newH2 = H2';


si = size(H2);
j=1;
k=1;
H2resh = H2';

for i=1:750
    
    H2resh(i,51) = k;       %Se asigna una columna de etiquetas referente a la categoria de cada imagen
    j = j+1;
    if (j >= 31)
        k = k+1;
        j = 1;
    end
end

features = H2resh(:,(1:50));
labels = H2resh(:,51);
nTrees = 160;

%...................Creaci�n del �rbol de decisi�n.................
tic
B = TreeBagger(nTrees,features,labels,'Method','classification','OOBPred','on','minleaf',25);    %Se crea el bosque, se permite ver la gráfica de error 'fuera de la bolsa' y se recorta el número de nodos a 41
toc
tic
for i=1:250                            %en vez de 250 se cambia por 750 para comparar con la base de entrenamiento
    newfeat = newH1(i,:);           
    %newfeat = newH2(i,:);             %Para comparar con la base de entrenamiento
    cat(i) = str2double(B.predict(newfeat));
end
    
categoryM_DT = reshape(cat',10,25)';   %Matriz de etiquetas de categor�a para cada imagen, en vez de 10 se cambia por 30 para comparar con la base de entrenamiento

for i=1:25,frec1(i,:) = (histc(categoryM_DT(i,:),1:25).*10);end       %en vez de 10 se cambia por (100/30) para comparar con la base de entrenamiento
toc
oobErrorBaggedEnsemble = oobError(B);
figure;plot(oobErrorBaggedEnsemble)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';

imagesc(frec1)
title(sprintf('Confusion matrix (%.2f %% accuracy)',mean(diag(frec1)) ))


