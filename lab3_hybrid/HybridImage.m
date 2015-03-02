clear all
close all
clc

img1 = imread('AnaAlign2.jpg');
h = fspecial('average',[75 75]);
img1fil = imfilter(img1,h,'replicate');
imshow(img1fil); 
img1h = img1-img1fil;
figure();imshow(img1h)

img2 = imread('CalavAlign2.jpg');
h2 = fspecial('average',[40 40]); 
img2fil = imfilter(img2,h2,'replicate');
figure(),imshow(img2fil)

imhyb = img1h + img2fil; 
figure, imshow(imhyb);


 T1 = impyramid(imhyb, 'reduce');T2 = impyramid(T1, 'reduce');T3 = impyramid(T2, 'reduce');T4 = impyramid(T3,'reduce');
 figure, imshow(T1);figure, imshow(T2);figure, imshow(T3);figure, imshow(T4);