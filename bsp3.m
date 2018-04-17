original = imread('343a.tif');

figure,imshow(original,[]);
lap = [0,1,0;1,-4,1;0,1,0] * -1; #sieht schärfer aus

#Laplace filter
laplacian = conv2(original, lap, "same");

figure,imshow(laplacian, []);

#sharpening
sharpened = original + laplacian;
figure,imshow(sharpened, []);

#Sobel
sx = [1,0,-1;2,0,-2;1,0,-1];
sy= [1,2,1; 0,0,0;-1,-2,-1];


gx = conv2(original, sx);
gy = conv2(original, sy);

sobel = sqrt(pow2(gx)+pow2(gy));
figure,imshow(sobel, []);