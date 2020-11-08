clc; clear; close all; 
% need to rename both of these directories for different folders
addpath(genpath("H:\METR4900 (THESIS)\Actual Bits and Pieces\Red"));
D = 'H:\METR4900 (THESIS)\Actual Bits and Pieces\Red';
files = dir(fullfile(D,'*.tif'));
BERs = [];
%original image is taken through processing and hashed for comaparison 
for i = 1:(numel(files)-1)
    filename1 = files(i).name;
    fragment1 = imread(filename1);
    f1 = perceptualHash(fragment1); 
    
    for j = (i+1):numel(files)
        filename2 = files(j).name; 
        fragment2 = imread(filename2);  
        f2 = perceptualHash(fragment2); 
        dist = hammingDistance(f1.hash, f2.hash); 
        BERs = [BERs dist.bitErrorRate];
    end 
end 

%% This is the plot of the Bit Error rate for my Thesis 
save('./BERs_Red', 'BERs');
figure(1)
plot(BERs); 
xlabel('Comparison'), ylabel('Bit Error Rate')
title('Bit Error Rate of Red Image Hashes')
hold on;
n = length(BERs);
xlim([1, n]);
y = ones(1, n) * .3;
plot(y, '--r');
