clc
clear variables
close all
% EX1

A=imread('house.tif');
imshow(A);
title('Original Image');
figure;
%WHY??
I=255*im2double(A);
%why HAAR?????????
[cA,cH,cV,cD] = dwt2(I,'haar');

subplot(2,2,1);imshow(cA,[]);
subplot(2,2,2);imshow(cH,[]);
subplot(2,2,3);imshow(cV,[]);
subplot(2,2,4);imshow(cD,[]);

I_edge_sobel=edge(I,'sobel');
figure;
imshow(I_edge_sobel,[]);
title('Edges using Sobel filter');

%%
%APPROACH 2-DWT
%???
wname = 'sym4';
[CA,CH,CV,CD] = dwt2(I,wname,'mode','per');

%Display the vertical detail image and the lowpass approximation.

subplot(2,2,1)
imagesc(CA); title('Lowpass Approximation');
subplot(2,2,2)
imagesc(CH); title('Horizontal Detail Image');
subplot(2,2,3)
imagesc(CV); title('Vertical Detail Image');
colormap gray;
subplot(2,2,4)
imagesc(CD); title('Diagonal Approximation');

%%
%EX3
A=imread('house.tif');
imshow(A);
title('Original Image');

I=255*im2double(A);
%DWT
[cA,cH,cV,cD] = dwt2(I,'haar');

figure;
subplot(2,2,1);imshow(cA,[]);title('Lowpass Approximation');
subplot(2,2,2);imshow(cH,[]);title('Horizontal Detail Image');
subplot(2,2,3);imshow(cV,[]);title('Vertical Detail Image');
subplot(2,2,4);imshow(cD,[]);title('Diagonal Approximation');
%Find edges in intensity image
BW = edge(I,'sobel');
BW1 = edge(I,'prewitt');
BW2 = edge(I,'canny',0.5);
BW3 = edge(I,'roberts');
BW4 = edge(I,'log');
BW5 = edge(I,'zerocross');
figure;
subplot(2,2,1);imshow(BW,[]);
title('Edges using Sobel filter');
subplot(2,2,2);imshow(BW1,[]);
title('Edges using Prewitt filter');
subplot(2,2,3);imshow(BW2,[]);
title('Edges using Canny Method');
subplot(2,2,4);imshow(BW3,[]);
title('Edges using Roberts Method');
figure;
subplot(1,2,1);imshow(BW4);
title('Edges using Laplacian of Gaussian Method');
subplot(1,2,2);imshow(BW5);
title('Edges using Zero-Cross Method');
%%
%EX4

A=imread('RoseOne.jpg');
imshow(A);
title('Original Image');

hsvI=rgb2hsv(A);
hPlane = 360.*hsvI(:, :, 1);   % Get the hue plane scaled from 0 to 360
sPlane = hsvI(:, :, 2);        % Get the saturation plane

nonRedIndex = (hPlane > 6) & ...  % Select "non-red" pixels
              (hPlane < 340);

% Keeping just Red          
sPlane(nonRedIndex) = 0;   % Set the selected pixel saturations to 0
hsvI(:, :, 2) = sPlane;        % Update the saturation plane
rgbImage = hsv2rgb(hsvI);

figure;imshow(rgbImage)
title('just Red!!');
%
figure;
A2=imread('Rose2.jpg');
imshow(A2);
title('Original Image');

hsvI2=rgb2hsv(A2);
hPlane2 = 360.*hsvI2(:, :, 1);   % Get the hue plane scaled from 0 to 360
sPlane2 = hsvI2(:, :, 2);        % Get the saturation plane

nonRedIndex = (hPlane2 > 6) & ...  % Select "non-red" pixels
              (hPlane2 < 340);

% Keeping just Red          
sPlane2(nonRedIndex) = 0;   % Set the selected pixel saturations to 0
hsvI2(:, :, 2) = sPlane2;        % Update the saturation plane
rgbImage2 = hsv2rgb(hsvI2);

figure;imshow(rgbImage2)
title('just Red!!');
%
figure;
%
A3=imread('IMG2.jpg');
imshow(A3);
title('Original Image');

hsvI3=rgb2hsv(A3);
hPlane3 = 360.*hsvI3(:, :, 1);   % Get the hue plane scaled from 0 to 360
sPlane3 = hsvI3(:, :, 2);        % Get the saturation plane

nonRedIndex = (hPlane3 > 6) & ...  % Select "non-red" pixels
              (hPlane3 < 340);

% Keeping just Red          
sPlane3(nonRedIndex) = 0;   % Set the selected pixel saturations to 0
hsvI3(:, :, 2) = sPlane3;        % Update the saturation plane
rgbImage3 = hsv2rgb(hsvI3);

figure;imshow(rgbImage3)
title('just Red!!');

%%
%EX5
clc
I=imread('Chips.png');
imshow(I);title('Original Image');
% d = imdistline
Igray = rgb2gray(I);
figure;
imshow(Igray);title('Grayscale Image');
Rmin = 20;
Rmax = 28;
% objest pol dark sen?????
[centers,radii] = imfindcircles(I,[Rmin Rmax],'ObjectPolarity','dark', ...
'Sensitivity',0.9)

figure;
imshow(I)
viscircles(centers,radii,'LineStyle','--');
%%
I=imread('Eye.jpg');
imshow(I);title('Original Image');
%d = imdistline
%
Rmin = 80;
Rmax = 100;
% objest pol dark sen?????
[centers,radii] = imfindcircles(I,[Rmin Rmax],'ObjectPolarity','dark','Sensitivity',0.98,'EdgeThreshold',0.1);

figure;
imshow(I)
viscircles(centers,radii,'LineStyle','--');
%%
I=imread('eye2.jpg');
imshow(I);title('Original Image');
%d = imdistline
%
Rmin = 90;
Rmax = 105;
% objest pol dark sen?????
[centers,radii] = imfindcircles(I,[Rmin Rmax],'ObjectPolarity','dark','Sensitivity',0.98,'EdgeThreshold',0.08);
[centers2,radii2] = imfindcircles(I,[25 40],'ObjectPolarity','dark','Sensitivity',0.94,'EdgeThreshold',0.1);
figure;
imshow(I)
viscircles(centers,radii,'LineStyle','--');
viscircles(centers2,radii2,'EdgeColor','g');
