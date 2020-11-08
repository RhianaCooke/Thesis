clc; clear; close all; 
addpath(genpath("H:\METR4900 (THESIS)\IMAGES"));

%Define images to process
OG = imread('QMDIU_00890.tif');  
%OG = imcrop(OG,[1100 0 14024 11188]); % get rid of the colour swatches 
%% Pre-Processing Morphology
BW = processImage(OG); % runs the process image function
figure(1)
subplot(2, 2, 4)
imshow(BW)

%% Identifying object properties
imageLabels = bwlabel(BW);
props1 = regionprops(BW, 'All'); 
numProps = size(props1, 1);

%% find size and intensity to remove objects 
bounds = bwboundaries(BW); 
numBounds = size(bounds, 1); 
bound = props1.BoundingBox; %create bounding boxes around the individual contours
rectangle('Position', bound, 'Linewidth', 2, 'EdgeColor', 'r')


% intensity = [props1.MeanIntensity];
% allArea = [props1.Area];
% intensityLimits = (intensity >150) & (instensity >220); % This wil change
% areaLimits = allArea < 2000;
% keepValues = find(intensityLimits & areaLimits); 
% % use these values for the seperation loop 

%% separating individual pieces 

for i = 1:numProps 
    
    bound = props1(i).BoundingBox; %create bounding boxes around the individual contours
    rectangle('Position', bound, 'Linewidth', 2, 'EdgeColor', 'r')
    hold on
    figure()
    imshow(BW)
    subImage = imcrop(OG, bound); 
    figure(); imshow(subImage);
    
    folder = 'H:\METR4900 (THESIS)\Actual Bits and Pieces';
    figureSave = sprintf('im23_%d.tif', i);
    fileName = fullfile(folder, figureSave); 
    saveas(gcf, fileName);
    
end


%% Active Contouring on individual images- not used in final implementation 
% complete on individual pieces

% for i = 0:1:210
%     image = sprintf("H:\METR4900\Actual Bits and Pieces\%02d.tif", i);
%     image = imread(image);    
% 
%     centroid = cat(1, props1.Centroid); 
%     identify = find(centroid(:, 1)>400 & centroid(:, 1) <1000);
%     imageMem = ismember(imageLabels, identify);
% 
%     props2 = regionprops(imageMem, 'Area', 'Centroid'); 
%     papyrusArea = max([props2.Area]); 
%     rad = round((sqrt(papyrusArea/pi)));
% 
%     centroid = cat(1, props2.Centroid); 
%     Xcentre = round(centroid(1, 1)); 
%     Ycentre = round(centroid(1, 2)); 
%     [Xgrid, Ygrid] = meshgrid(1:size(BW, 2), 1:size(BW, 1)); 
% 
%     Mask = ((Xgrid-Xcentre).^2 + (Ygrid-Ycentre).^2) <= rad.^2;
%     b = activecontour(BW, Mask, 100, 'edge'); 
%     
%     display on the image 
%     figure(2), imshow(OG);
%     hold on 
%     
%     %display the outline on each of the torn peices 
%     bounds = visboundaries(b, 'Color', 'r');  
%     %contourf(b(20),10,'edgecolor','none');
%     set(gca, 'position', [0 0 1 1], 'units', 'normalized'); 
% 
% end 

%% display each contour on the image and save as
% display on the image 
% figure(2), imshow(OG);
% hold on 
% 
% %display the outline on each of the torn peices 
% bounds = visboundaries(b, 'Color', 'r');  
% %contourf(b(20),10,'edgecolor','none');
% set(gca, 'position', [0 0 1 1], 'units', 'normalized'); 
% 
% %% save file
% folder = 'H:\METR4900'; 
% figureSave = sprintf('%s', '1', '.tif');
% fileName = fullfile(folder, figureSave); 
% saveas(gcf, fileName);
    
    

