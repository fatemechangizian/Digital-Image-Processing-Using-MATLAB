%EX1
close all
clear variables
clc
I=imread('ManMask.bmp');
se = strel('square', 5); 
%se=ones(5);
eroded = imerode(I,se);
BoundI=I-eroded;
subplot(1,3,1)
imshow(I)
title('Original Image');
subplot(1,3,2)
imshow(eroded)
title('Eroded Image');
subplot(1,3,3)
imshow(BoundI)
title('Boundary of Image');

%%
%EX2
clc
I=imread('coins.png');
subplot(1,3,1);imshow(I)
title('Original Image');
BW = im2bw(I);
subplot(1,3,2);imshow(BW)
title('BW Image');
BWfill = imfill(BW,'holes');
[L, num] = bwlabel(BWfill);
subplot(1,3,3);imshow(L)
title('Filled Image');
%???
s  = regionprops(L,'Centroid')
hold on
for k = 1:numel(s)
    %???
    c = s(k).Centroid;
    text(c(1), c(2), sprintf('%d', k),'HorizontalAlignment','center','VerticalAlignment', 'middle')
end
hold off
%%
