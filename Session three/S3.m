clc
clear variables
close all
% EX3

A=imread('hotel.tif');
imshow(A);
title('Original Image');
figure;
I=rgb2ycbcr(A);
% Luma (Y) value
I=I(:,:,1);
imshow(I);
title('Grayscale version of  YCbCr Image');
% 2D fft of the GS image 
img_fft=fft2(I);

% Filtering1
% Define filter type
filter_avg=(1/9)*ones(3,3);
img_filtered1=imfilter(I,filter_avg);
figure;
imshow(uint8(img_filtered1));title('Filtered Image using Average filter,size 3*3');
% 2D fft of the filtered image 
img_fftf1=fft2(img_filtered1); 

figure;
subplot(2,2,1)
imshow(fftshift(log10(img_fft)),[]);
title('The SHIFTED MAG FFT IMAGE');
subplot(2,2,2)
imshow(fftshift(log10(img_fftf1)),[]);
title('The SHIFTED log MAG FFT FILTERED IMAGE');
subplot(2,2,3)
imshow(fftshift(angle(img_fft)),[]);
title('The SHIFTED phase FFT Image');
subplot(2,2,4)
imshow(fftshift(angle(img_fftf1)),[]);
title('The SHIFTED phase FFT FILTERED Image');

% Filtering2
filter_avg2=[1,-1,1;-1,1,-1;1,-1,1];
img_filtered2=imfilter(I,filter_avg2);
figure;
imshow(uint8(img_filtered2));title('Filtered Image using 2nd filter,size 3*3');
img_fftf2=fft2(img_filtered2); %2D fft of the image 

figure;
subplot(2,2,1)
imshow(fftshift(log10(img_fft)),[]);
title('The SHIFTED MAG FFT IMAGE');
subplot(2,2,2)
imshow(fftshift(log10(img_fftf2)),[]);
title('The SHIFTED log MAG FFT FILTERED IMAGE2');
subplot(2,2,3)
imshow(fftshift(angle(img_fft)),[]);
title('The SHIFTED phase FFT Image');
subplot(2,2,4)
imshow(fftshift(angle(img_fftf2)),[]);
title('The SHIFTED phase FFT FILTERED Image2');
%%

