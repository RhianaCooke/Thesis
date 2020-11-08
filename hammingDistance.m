function h = hammingDistance(imgHash1, imgHash2)
    %imghash1 is the hash value for the first image
    %imghash2 is the hash value for th comparative image
    h.HD = pdist2(imgHash1, imgHash2, 'hamming')*length(imgHash1); 
    
    h.normHD = pdist2(imgHash1, imgHash2, 'hamming'); 
    
    h.bitErrorRate = biterr(imgHash1, imgHash2) / length(imgHash1); 
    
    