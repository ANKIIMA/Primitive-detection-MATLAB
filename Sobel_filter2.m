clear all;clc
close all;
gray_image = imread('Cameraman256.png');

%% ����sobelģ��
hx = [-1 -2 -1;0 0 0 ;1 2 1];%����sobel��ֱ�ݶ�ģ��
hy = hx';                    %����sobelˮƽ�ݶ�ģ��
%% ����ͼ���sobel�ݶ�
%��ֱ�ݶ�
gradx = filter2(hx,gray_image,'same');
gradx = abs(gradx); %����ͼ���sobel��ֱ�ݶ�
%ˮƽ�ݶ�
grady = filter2(hy,gray_image,'same');
grady = abs(grady); %����ͼ���sobelˮƽ�ݶ�
%sobel�ݶ�
grad = gradx + grady;  %�õ�ͼ���sobel�ݶ�
%% ��ʾ
subplot(2,2,1);imshow(gray_image);title('ԭͼ');
subplot(2,2,2);imshow(gradx,[]);title('ͼ���sobel��ֱ�ݶ�');
subplot(2,2,3);imshow(grady,[]);title('ͼ���sobelˮƽ�ݶ�');
subplot(2,2,4);imshow(grad,[]);title('ͼ���sobel�ݶ�');
