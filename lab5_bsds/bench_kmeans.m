addpath benchmarks

clear all;close all;clc;

imgDir = '../BSDS500/data/images/test';
gtDir = '../BSDS500/data/groundTruth/test';
pbDir = '../BSDS500/segskmeans/test';            %Directorio donde se encuentran toda las segmentaciones creadas por el método elegido, para cambiar a gmm se cambia segskmeans por segsgmm.  
outDir = '../BSDS500/segskmeans/test_eval';      %Directorio donde se guardarán las soluciones
mkdir(outDir);


nthresh = 99;
% running all the benchmarks can take several hours.
tic;
boundaryBench(imgDir, gtDir, pbDir, outDir, nthresh);
toc;

plot_eval(outDir);