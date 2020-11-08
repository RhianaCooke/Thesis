# Thesis
This folder contains code (but not data) relevant to The Book of the Dead Thesis Project completed for The University of Queensland in 2020. 

get_histogram.m simply generates a histogrpm for a given image.  

segmenting.m runs an algorithm on the images provided to remove all objects made up of less than 6000 pixels by taking in processImage.m
This also cuts out individial fragmenst and saves them to the specified folder. 

runMASK.m takes either redMask2.m or greenMask.m and crates a mask on an image using the specified mask. 

compareImages.m takes preProcess.m, preceptualHash.m and hammingDistance.m to gereate hashes of individual images and compare the images based on the hamming distane and bit error rates.  

showHashWorking.m and errorDistPlots.m are both verification functions used to plot or display figures to show the processes these functions are undertaking. 
