clc; clear; close all; 
% need to rename both of these directories for different folders
addpath(genpath("H:\METR4900 (THESIS)\Actual Bits and Pieces\Bigs"));
D = 'H:\METR4900 (THESIS)\Actual Bits and Pieces\Bigs';
file1 = dir(fullfile(D,'im0_4.tif'));

filename1 = file1.name;
fragment1 = imread(filename1);
figure()
imshow(fragment1)
BW = rgb2gray(fragment1);
BW = histeq(BW);  
figure()
imshow(BW)

flt = fspecial('gaussian', [3 3], 2); 
BW = imfilter(BW, flt, 'same'); 
figure()
imshow(BW)

img = imresize(BW, [64 64], 'bicubic');
figure()
imshow(img)

image = dct2(img, [64, 64]);
figure()
imshow(image); 

vect = image(:)'; 
vect = vect(1: length(vect)); 
mean = mean2(vect); 
 
image = (image >= mean); 
figure();
imshow(image); 
 





%% Second image and hamming 
file2 = dir(fullfile(D,'im0_5.tif'));
filename2 = file2.name;
fragment2 = imread(filename2);
f1 = perceptualHash(fragment1);
f2 = perceptualHash(fragment2);

dist = hammingDistance(f1.hash, f2.hash); 
errorrate = dist.bitErrorRate
binary = num2str(f1.hash)
