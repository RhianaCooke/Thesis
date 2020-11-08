%clc; clear; close all; 
% need to rename both of these directories for different folders

addpath(genpath("H:\METR4900 (THESIS)\Actual Bits and Pieces\Tests\n8"));
D = 'H:\METR4900 (THESIS)\Actual Bits and Pieces\Tests\n8';
files = dir(fullfile(D,'*.tif'));

%original image is taken through processing and hashed for comaparison 
for i = 1:(numel(files)-1)
    filename1 = files(i).name;
    fragment1 = imread(filename1);
%     imshow(fragment1)
%     pause(2)
    f1 = perceptualHash(fragment1); 
    
    %compare other images in the folder to the original image 
    %original image will be each image in the folder 
    for j = (i+1):numel(files)
          filename2 = files(j).name; 
          fragment2 = imread(filename2);  
          f2 = perceptualHash(fragment2); 
%           imshow(fragment2)
%           pause(2)
          dist = hammingDistance(f1.hash, f2.hash); 
          
          format = ' %s vs %s:\n %s, Error: %s, Hamming Distance: %s, Norm Hamming Distance: %s\n\n'; 
          fprintf(format, files(i).name, files(j).name, num2str(sum(f2.hash), '%1d'), num2str(dist.bitErrorRate), num2str(dist.HD), ...
              num2str(dist.normHD))
          
          if dist.normHD < 0.4
              figure(1)
              subplot(1, 2, 1);imshow(fragment1); 
              subplot(1, 2, 2); imshow(fragment2);
              
              folder = 'H:\METR4900 (THESIS)\Actual Bits and Pieces\Tests\n8';
              figureSave = sprintf('im_%d_%d.tif', i, j);
              fileName = fullfile(folder, figureSave); 
              saveas(gcf, fileName);
          end 
    
    end 
end 