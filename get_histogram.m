function  hist = get_histogram(image)    

    %Split into RGB Channels
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);
    %Get histValues for each channel
    [yRed, x] = imhist(Red);    
    [yGreen, x] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    
    
    %Plot them together in one plot
    hist = plot(x(1:254), yRed(1:254), 'Red', x(1:254), yGreen(1:254), 'Green', x(1:254), yBlue(1:254), 'Blue');
    
end
