% Morphology 
function BW = processImage(image)
    BW = rgb2gray(image);  
    figure()
    subplot(2, 2, 1)
    imshow(BW)
    % values for processing the larger image
    BW = imadjust(BW, [0.3 0.5], [0.01 0.99], 20);
    BW = imbinarize(BW);
    BW = 1-BW;
    figure(1)
    subplot(2, 2, 2)
    imshow(BW)

%     imshow(BW)
%     pause(2) 
    BW = imclearborder(BW);
    BW = bwareaopen(BW, 6000); %removes tags and small objects 
    figure(1)
    subplot(2, 2, 3)
    imshow(BW)
%     imshow(BW)
%     pause(2)

    EDGE = edge(BW,'canny', 0.1);
    DILATE = imdilate(EDGE, strel('disk',1, 0));
    FILL = imfill(DILATE, 'holes'); 
    BW = edge(FILL); 
    BW = imdilate(BW, strel('disk', 2, 4)); 
    BW = imfill(BW, 'holes');
%     imshow(BW)
%     pause(2)
end