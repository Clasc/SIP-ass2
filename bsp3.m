close all;
clear all;

original = double (imread('343a.tif'));
i = 1;
subplot(2,4,i++),imshow(original,[]);
title("(a) Original");
lap = [0,1,0;1,-4,1;0,1,0] * -1; #sieht schaerfer aus

#Laplace filter
laplacian = conv2(original, lap, "same");

subplot(2,4,i++),imshow(laplacian, []);
title("(b) Laplace");

#sharpening
sharpened = original + laplacian;
subplot(2,4,i++),imshow(sharpened, []);
title("(c)Laplace sharpened");

#Sobel
sx = double([1,0,-1;2,0,-2;1,0,-1]);
sy= double([1,2,1; 0,0,0;-1,-2,-1]);


gx = conv2(original, sx, 'same');
gy = conv2(original, sy, 'same');

sobelgradient = sqrt(gx.^2 +gy.^2);
sobel = original + sobelgradient;

subplot(2,4,i++),imshow(sobel, []);
title("(d) Sobel sharpened");

#smoothing 5x5
smooth(1:5,1:5) = 1;
smooth *= 1/25;
smoothed = conv2(sobel, smooth, 'same');

subplot(2,4,i++),imshow(smoothed, []);
title("(e) Smoothed 5x5");

#mask image
mask = sharpened.* smoothed;
subplot(2,4,i++),imshow(mask, []);
title("(f) Mask");


#g sum of a & f
g = original + mask;
subplot(2,4,i++),imshow(g, []);
title("(g) sharpened by (a) + (f)");


#h power law transformation
g.*1;
boosted = g.^0.2;
subplot(2,4,i++),imshow(boosted, []);
title("(h) gamma boost by 2");



