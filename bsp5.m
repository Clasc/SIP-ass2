#bsp5
#Christian Lascsak
#01363742

close all;
clear all;

i=1;
img = imread("429a.png");
[m,n,z] = size(img);
D0 = 0.03; #konstante size für gaussian filter
u = 0:(m-1);
v = 0:(n-1);

indexu = find(u > m/2);
u(indexu) = u(indexu) - m; 
 #u = u.- m/2;
indexv = find(v > n/2);
v(indexv) = v(indexv) - n;  #flip indices around the axes
 #v = v.- v/2;
[V, U]= meshgrid(v, u);

F = fft2(img);
F2 = abs(F);
F2 = log(1+F2);
F2 = fftshift(F2);

subplot(2,2,i++),imshow(F2, []);
title("Fourier");

D = sqrt(U.^2 + V.^2);

H = exp((-1)*(D.^2)/2*D0^2); #create lowpassfilter

blurred = H.* F2; 

usmask = F2 - blurred; #unsharpening mask created

sharpened = F2 + usmask; 

sharpened = real(ifft2(sharpened)); #real part of inverse FFT
sharpened = log(1+sharpened); 


subplot(2,2,i++),imshow(usmask, []);
title("Unsharpening mask");

subplot(2,2,i++),imshow(img, []);
title("original");
subplot(2,2,i++),imshow(sharpened, []);
title("Sharpened by unsharpening mask");