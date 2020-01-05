clc
clear variables
close all
%EX1

A=imread('LetterA.jpg');
figure;
imshow(A);
title('Original Image');
%?? WHERE SHOULD WE USE THIS CODE?
F=255*im2double(A);

%Input size
M = size(F,1)
outsize=M;

%Filter Size
n=[3,5,9,15,35];

for m=n
    %padded F
    P=(m-1)/2;
    D= zeros(P,M);
    F1=[D;F;D];
    E= zeros(M+(2*P),P);
    F2=[E F1 E];
    
    % Kernel
    h=(1/m^2)*ones(m);
    
    % Filtering
    output=zeros(outsize);
    N=size(F2,2);
    
 for i=1+P:N-P
     for j=1+P:N-P
         
        block=F2(i-((m-1)/2):i+((m-1)/2),j-((m-1)/2):j+((m-1)/2));
        res=block.*h;
        % sum of all array elements
        filtered=sum(res(:));
        output(i-P,j-P)=filtered;
     end
 end
 figure
 imshow(uint8(output));
 title(['n= ', int2str(m)]);
end
%%
%EX2

A=imread('Moon.jpg');
imshow(A);
title('Original Image2');
figure;
F=255*im2double(A);
% Filter
H = fspecial('laplacian');

filtered = imfilter(F,H);
imshow(uint8(filtered))
title('Filtered Image using Laplacian Filter');

%*****Enhancement**********
%???
x=(size(H,1)+1)/2;
if H(x,x)>0
    enhanced = F+filtered;

else
   enhanced = F-filtered;

end


figure;
subplot(1,2,1)
imshow(A);
title('Original Image');

subplot(1,2,2)
imshow(uint8(enhanced));
title('Enhanced Image');
%%
%EX3
A=imread('Pasta_GS.jpg');
imshow(A);
title('Original Image3');

I= 255*im2double(A);

h1 = fspecial('average');
filtered1 = imfilter(I,h1);

h2 = fspecial('disk');
filtered2 = imfilter(I,h2);

h3 = fspecial('gaussian');
filtered3 = imfilter(I,h3);

h4 = fspecial('laplacian');
filtered4 = imfilter(I,h4);

h5 = fspecial('log');
filtered5 = imfilter(I,h5);

h6 = fspecial('motion');
filtered6 = imfilter(I,h6);

h7 = fspecial('prewitt');
filtered7 = imfilter(I,h7);

h8 = fspecial('sobel');
filtered8 = imfilter(I,h8);

figure;
subplot(2,2,1)
imshow(uint8(filtered1));
title('average filter');

subplot(2,2,2)
imshow(uint8(filtered2));
title('disk filter');

subplot(2,2,3)
imshow(uint8(filtered3));
title('gaussian filter');

subplot(2,2,4)
imshow(uint8(filtered4));
title('laplacian filter');
figure;
subplot(2,2,1)
imshow(uint8(filtered5));
title('log filter');

subplot(2,2,2)
imshow(uint8(filtered6));
title('motion filter');

subplot(2,2,3)
imshow(uint8(filtered7));
title('prewitt filter');

subplot(2,2,4)
imshow(uint8(filtered8));
title('sobel filter');

%%
%EX4
clc
I=imread('Cameraman_GS.jpg');
imshow(I);
title('Original Image4');

%I= 255*im2double(A); WHY WE DO NOT USE IT HERE?
figure;

J = imnoise(I,'salt & pepper');
imshow(J);
title('noisy Image');
figure;

K = medfilt2(J);
imshow(K)
title('enhanced Image');

%%
%Ex5
% f=0.01 , f=0.48
clc
clear variables
close all

f1=0.01;% f is the frequnecy 
F1=zeros(256,256);%this matrix stores  the image  with f1

for m=0:255
    for n=0:255
        F1(n+1,m+1)=128+(127*(cos(2*pi*f1*m))*(cos(2*pi*f1*n))) ;
    end
end

imshow(F1,[]);%showing the Image with f1
title(['The Image with f1=', num2str(f1)]);

figure;

f2=0.48;% f is the frequnecy 
F2=zeros(256,256);

for m=0:255
    for n=0:255
        F2(n+1,m+1)=128+(127*(cos(2*pi*f2*m))*(cos(2*pi*f2*n))) ;
    end
end

imshow(F2,[]);
title(['The Image with f2=', num2str(f2)]);

figure;
subplot(2,2,1)
imshow(F1,[]);%showing the Image with f1
title('The original Image1');
% pads X with zeros to create an m-by-n array before doing the transform. The result is m-by-n
FFT1 = fft2(F1);
subplot(2,2,2)
imshow(fftshift(abs(FFT1)),[]);
title('The SHIFTED  MAG FFT');
subplot(2,2,3)
imshow(fftshift(log10(FFT1)),[]);
title('The SHIFTED log MAG FFT');
subplot(2,2,4)
imshow(fftshift(angle(FFT1)),[]);
title(['The SHIFTED  phase FFT Image with f1=', num2str(f1)]);
figure;

subplot(2,2,1)
imshow(F2,[]);
title('The original Image2');
FFT2 = fft2(F2);
subplot(2,2,2)
imshow(fftshift(abs(FFT2)),[]);
title('The SHIFTED  MAG FFT');
subplot(2,2,3)
imshow(fftshift(log10(FFT2)),[]);
title('The SHIFTED   log MAG FFT');
subplot(2,2,4)
imshow(fftshift(angle(FFT2)),[]);
title(['The SHIFTED  phase FFT Image with f2=', num2str(f2)]);

%%
%EX6
I = imread('peppers.tiff');
J = rgb2gray(I);
figure, imshow(I), figure, imshow(J);
B = imresize(J, [256 256]);
figure, imshow(B);




