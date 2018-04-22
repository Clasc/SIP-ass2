#bsp5
#Christian Lascsak
#01363742

close all;
clear all;

i=1;
img = imread('blurry-moon.tif');
[m,n,z] = size(img);
D0 = 0.05; #konstante size für gaussian filter
u = 0:(m-1);
v = 0:(n-1);

imgMin = min(min(abs(img)));
imgMax = max(max(abs(img)));


indexu = find(u > m/2);
u(indexu) = u(indexu) - m; 
 #u = u.- m/2;
indexv = find(v > n/2);
v(indexv) = v(indexv) - n;  #flip indices around the axes
 #v = v.- v/2;
[V, U]= meshgrid(v, u);

F = fft2(img);

subplot(2,3,i++),imshow(F, [imgMin imgMax]);
title("Fourier");

D = sqrt(U.^2 + V.^2);

H = exp((-1)*(D.^2)/2*D0^2); #create lowpassfilter

blurred = H.* F; 

usmask = F.- blurred; #unsharpening mask created

sharpened = F.+ usmask; 

sharpened = real(ifft2(sharpened)); #real part of inverse FFT
%sharpened = log(1+sharpened); 


subplot(2,3,i++),imshow(usmask, [imgMin imgMax]);
title("Unsharpening mask");

subplot(2,3,i++),imshow(img, [imgMin imgMax]);
title("original");

subplot(2,3,i++), imshow(F.-usmask, [imgMin imgMax]);
title("Boosted frequencies:\n original - unsharp mask.");

subplot(2,3,i++),imshow(sharpened, [imgMin imgMax]);
title("Sharpened by \n unsharpening mask");