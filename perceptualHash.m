function img = perceptualHash(image)
    %% DCT based perceptual hashing 
    %create hash and make binary vector
    image = preProcess(image); 
    
    image = dct2(image, [64, 64]); 
    vect = image(:)'; 
    vect = vect(1: length(vect)); 
    mean = mean2(vect); 
    
    image = (image >= mean); 
  
    img.processed = image; 
    
    img.hash = double(img.processed(:)'); 
    
   
    