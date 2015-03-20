
%Este código permite realizar la segmentación de un método de clustering
%para 5 valores diferentes de número de clusters. 


clc
clear all

addpath 'C:\Users\js.cuellar169\Dropbox\Vision Artificial\Lab4'  %Se incluye el path del directorio donde se encuentra la función segment_by_clustering

dire = ('C:\VisionArtificial\Lab 5\BSR\BSDS500\data\images\test\*.jpg');   %Se incluye el directorio que contiene las imágenes de test
d = dir(dire);
N = {d.name};
segkmeans{1,5} = zeros;
seggmm{1,5} = zeros;


% Función de clustering creada en las sesiones de laboratorio pasadas

for i=1:1:200;
    for j = 2:1:6;
        A = segment_by_clustering( N{i},'rgb', 'gmm', j);       %Para calcular las segmentaciones usando kmeans se cambia 'gmm' por 'kmeans' y
        seggmm{i,j-1} = A;                                      %se asigna  segkmeans{i,j-1} = A
        nn=i/200*100
    end
end

%% Guarda imágenes individuales en un solo arreglo de celdas llamado 'segs'

segs {1,5} = zeros;

for k=1:1:200;
    for l = 1:1:5;
        segs{1,l} = seggmm{k,l};                              %Para guardar las celdas del método kmeans se cambia 'seggmm' por 'kmeans' 
    end
    name = regexp(N{k} ,'\.', 'split');                       %Comando utilizado en Matlab 2012a para separar 'strings', en versiones más actuales se usa el comando 'strsplit'.
    save(strcat(name{1}),'segs');
end
