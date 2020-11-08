clc; clear; close all; 
% need to rename both of these directories for different folders
addpath(genpath("H:\METR4900 (THESIS)\Actual Bits and Pieces\Red"));
D = 'H:\METR4900 (THESIS)\Actual Bits and Pieces\Red';
files = dir(fullfile(D,'*.tif'));

%% check images for Particular colour    
 
for i = 1:numel(files)
    filename = files(i).name;
    fragment = imread(filename);
    
    image = sprintf('Actual Bits and Pieces/%d.tif', i); 
    fragment = imread(image);
    %change this to redMask2() if you wan to filter red
    red = redMask2(fragment); %find particular colour on the fragments 
    subplot(1, 2, 1)
    imshow(fragment)
    
    subplot(1, 2, 2)
    imshow(red)
    pause(1)

 end 