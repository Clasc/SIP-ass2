#bsp5
#Christian Lascsak
#01363742

close all;
clear all;
img = imread("429a.png");
[m,n,z] = size(img);
D0 = 0.03; #konstante size für gaussian filter
u = 0:(m-1);
v = 0:(n-1);

indexu = find(u > m/2);
u(indexu) = u(indexu) - m; 
 #u = u.- m/2;
indexv = find(v > n/2);
v(indexu) = v(indexu) - n; 
 #v = v.- v/2;
[V, U]= meshgrid(v, u);




D;
H; # H-> gaussian filter -> .* original  = blurred