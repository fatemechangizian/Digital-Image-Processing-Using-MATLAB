clc
clear variables
close all
A=imread('Cameraman_GS.jpg');
Res1 = size(A)
range1=[min(A(:)),max(A(:))]
B=im2bw(A);
Res2=size(B)
range2=[min(B(:)),max(B(:))]

imshow(A);
figure;
imshow(B);
figure;

subplot(1,2,1);
imshow(A);
xlabel('Grayscale');
subplot(1,2,2);
imshow(B);
xlabel('Black and White');

%%
clc
clear variables
close all
I=imread('pasta.tif');
I=im2double(I);
Res = size(I);

subplot(2,2,1)
imshow(I)
title('***pasta***');

subplot(2,2,2)
imshow(I(:,:,1));
title('Red Channel');

subplot(2,2,3)
imshow(I(:,:,2));
title('Green Channel');

subplot(2,2,4)
imshow(I(:,:,3));
title('Blue Channel');


figure;


subplot(2,2,1)
H=rgb2hsv(I);
imshow(H)

subplot(2,2,2)
imshow(H(:,:,1));
title('Hue Channel');

subplot(2,2,3)
imshow(H(:,:,2));
title('Saturation Channel');

subplot(2,2,4)
imshow(H(:,:,3));
title('Intensity Channel');


figure;


subplot(2,2,1)
C=rgb2ycbcr(I);
imshow(C)

subplot(2,2,2)
imshow(C(:,:,1));
title('Y Channel');

subplot(2,2,3)
imshow(C(:,:,2));
title('Cb Channel');

subplot(2,2,4)
imshow(C(:,:,3));
title('Cr Channel');

figure;

G=rgb2gray(I);
imshow(G)

subplot(2,2,1)
imshow(G)
title('grayscale')
subplot(2,2,2)
imshow(C)
title('YCbCr')
subplot(2,2,3)
imshow(H)
title('HSI')
subplot(2,2,4)
imshow(I)
title('RGB')
 %%
clc
clear variables
close all
im=imread('image_dark.pgm');
[M,N] = size(im)
subplot(2,2,1);
imshow(im)
title('original')
his = histeq(im);
subplot(2,2,2);
imshow(his)
subplot(2,2,3);
his1 = histeq(im,4);
imshow(his1)

subplot(2,2,4);
his2 = histeq(im,8);
imshow(his2)


Q=imhist(im,256)
p=zeros(256,1);
for(i=1:1:256)
    for(j=1:1:i)
        P(j,1)= Q(j,1)/(M*N);
        if(j~=1)
        P(j,1)= P(j,1)+P(j-1,1);
        end
    end
    S(i,1)=(255)*(P(i,1));
end 
figure;
S;
SR=round(S);
Qn=Q/(M*N);
%
plot(SR,Qn,'bo')
figure;
imhist(uint8(SR))

%%
[R,G,B] = ind2rgb('pasta.tif')
figure;
imshow(R)
title('Red Channel')
figure;
imshow(G)
title('Green Channel')
figure;
imshow(B)
title('Blue Channel')
