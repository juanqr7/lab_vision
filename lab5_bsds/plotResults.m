clear all
clc

% Código para dibujar las curvas de precision vs recall para los métodos evaluados 

addpath benchmarks;                                  


dirnames{1} = '../BSDS500/segskmeans/test_eval';     % Directorio con la solución de las segmentaciones por kmeans
dirnames{2} = '../BSDS500/ucm2/test_eval';           % Directorio con la solución de las segmentaciones por ucm
dirnames{3} = '../BSDS500/segsgmm/test_eval';        % Directorio con la solución de las segmentaciones por gmm

color{1} = 'b';
color{2} = 'k';
color{3} = 'm';

open('isoF.fig');
p(3,1) = zeros;

for i=1:3


p(i) = plot_eval(dirnames{i},color{i})               % Permite graficar cada método de clustering, devuelve un valor p(i) que identifica cada curva


end


legend([p(1) p(2) p(3)],{'kmeans','ucm','gmm'})      % Utilizando los valores p(i) que identifican la curva de cada método de clustering se puede asignar la leyenda respectiva
