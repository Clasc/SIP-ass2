#bsp3
#Christian Lascsak
#01363742

close all;
clear all;

Im424a=imread('424a.png');
Im429a=imread('429a.png');

Im424a=fft2(Im424a);
Im424a=fftshift(Im424a);
#combine real an imaginary part
Im424a=abs(Im424a);
#reduce contrast (just for imshow() call
#Im424a=log(1+Im424a);
figure,imagesc(Im424a,clim=[5 13]);
#imshow(Im424a,[]);
colormap gray;

Im429a=fft2(Im429a);
Im429a=fftshift(Im429a);

#reduce contrast & show imaginary and real part
figure,imagesc(log(1+abs(Im429a)),clim=[5, 13]);
colormap gray;





