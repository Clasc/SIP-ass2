#bsp2
#Christian Lascsak
#01363742
close all;
clear all;

x = [0,1,2,1,0,0];
h = [0,0,0,-1,,-2,0,2,1,0,0];
impresponse = deconv(x,h);
x1 = [0,0,1,2,3,4,3,2,1,0,0];
h2 = conv1(x1,impresponse);

subplot(1,2,1),stem(impresponse)
title = ("impulse response");

subplot(1,2,1),stem(h2);
title = ("response to x1");