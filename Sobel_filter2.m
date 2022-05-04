clear all;clc
close all;
gray_image = imread('Cameraman256.png');

%% 构造sobel模板
hx = [-1 -2 -1;0 0 0 ;1 2 1];%生产sobel垂直梯度模板
hy = hx';                    %生产sobel水平梯度模板
%% 计算图像的sobel梯度
%垂直梯度
gradx = filter2(hx,gray_image,'same');
gradx = abs(gradx); %计算图像的sobel垂直梯度
%水平梯度
grady = filter2(hy,gray_image,'same');
grady = abs(grady); %计算图像的sobel水平梯度
%sobel梯度
grad = gradx + grady;  %得到图像的sobel梯度
%% 显示
subplot(2,2,1);imshow(gray_image);title('原图');
subplot(2,2,2);imshow(gradx,[]);title('图像的sobel垂直梯度');
subplot(2,2,3);imshow(grady,[]);title('图像的sobel水平梯度');
subplot(2,2,4);imshow(grad,[]);title('图像的sobel梯度');
