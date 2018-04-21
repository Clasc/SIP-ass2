#bsp2
#Christian Lascsak
#01363742

close all;
clear all;

x = [1,2,1];
h = [-1,-2,0,2,1];
impresponse = deconv(h,x);
x1 = [1,2,3,4,3,2,1];
h2 = conv1(x1,impresponse);

figure,subplot(1,2,1),stem(impresponse);
title("impulse response");

subplot(1,2,2),stem(h2);
title("response to x1");
