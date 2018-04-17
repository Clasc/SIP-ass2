original = imread('343a.tif');

figure,imshow(original,[]);
title("Original");
lap = [0,1,0;1,-4,1;0,1,0] * -1; #sieht schaerfer aus

#Laplace filter
laplacian = conv2(original, lap, "same");

figure,imshow(laplacian, []);
title("Laplace");

#sharpening
sharpened = original + laplacian;
figure,imshow(sharpened, []);
title("Laplace sharpened");

#Sobel
sx = [1,0,-1;2,0,-2;1,0,-1];
sy= [1,2,1; 0,0,0;-1,-2,-1];


gx = conv2(original, sx, 'same');
gy = conv2(original, sy, 'same');

sobel = gx+gy;
sobel += original;


figure,imshow(sobel, []);
title("Sobel sharpened");

#smoothing 5x5
smooth(1:5,1:5) = 1;
smooth *= 1/25;
smoothed = conv2(sobel, smooth, 'same');

figure,imshow(smoothed, []);
title("Smoothed 5x5");

#mask image
mask= conv2(sharpened,smoothed,'same');
figure,imshow(mask, []);
title("Mask");




