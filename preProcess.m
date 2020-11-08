function img = preProcess(image) 

    % make image black and white 
    BW = rgb2gray(image);
    BW = histeq(BW);  
    
    % blur the images for processing 
    flt = fspecial('gaussian', [3 3], 2); 
    BW = imfilter(BW, flt, 'same'); 
    
    % resize to an 64x64
    img = imresize(BW, [64 64], 'bicubic');
    


        
    

    
    
    
    