clear all;clc

img=imread('house.png');house=img;
img=rgb2gray(img);
img=im2double(img);
figure();
subplot(2,2,1);
imshow(house);
title('ԭͼ');
[m,n]=size(img);

hx = [-1 -2 -1;0 0 0 ;1 2 1];%����sobel��ֱ�ݶ�ģ��
hy = hx';                    %����sobelˮƽ�ݶ�ģ��
%% Ԥ����
%��ֱ�ݶ�
gradx = filter2(hx,img,'same');
gradx = abs(gradx); %����ͼ���sobel��ֱ�ݶ�
%ˮƽ�ݶ�
grady = filter2(hy,img,'same');
grady = abs(grady); %����ͼ���sobelˮƽ�ݶ�
%sobel�ݶ�
grad = gradx + grady;  %�õ�ͼ���sobel�ݶ�
subplot(2,2,2);imshow(grad);title('Sobel������ȡͼ���Ե');
I = grad;

%��ֵ�˲�
[m,n]=size(I);
y = zeros(m,n);
for i=2:m-1 
    for j=2:n-1 
        y(i,j)=I(i-1,j-1)+I(i-1,j)+I(i-1,j+1)+I(i,j-1)+I(i,j)+I(i,j+1)+I(i+1,j-1)+I(i+1,j)+I(i+1,j+1);
        y(i,j)=y(i,j)/9; 
    end 
end
subplot(2,2,3);imshow(y);title('��ֵȥ���');


%��ֵ��
q=im2uint8(y);
[m,n]=size(q);
for i=1:m 
    for j=1:n 
        if q(i,j)>160     
            q(i,j)=255;    
        else 
            q(i,j)=0;
        end
    end
end
subplot(2,2,4);imshow(q);title('��ֵ�������');

%% hough�任���
theta=180;
dis=round(sqrt(m^2+n^2));
s=zeros(theta,2*dis);
z=cell(theta,2*dis);
for i=1:m
    for j=1:n 
        if (q(i,j)==255) 
            for k=1:theta
                p=round(i*cos(pi*k/180)+j*sin(pi*k/180));  
                %��ÿ�����1��180�ȱ���
                if(p>0)
                    s(k,dis+p)=s(k,dis+p)+1;
                    z{k,dis+p}=[z{k,dis+p},[i,j]'];
                else
                    ap=abs(p)+1;
                    s(k,ap)=s(k,ap)+1;
                    z{k,ap}=[z{k,ap},[i,j]'];
                end
            end
        end
    end
end

for i=1:theta
    for j=1:dis*2
        if(s(i,j)>120)
            lp=z{i,j};
            for k=1:s(i,j)
                house(lp(1,k),lp(2,k),1)=255;
                house(lp(1,k),lp(2,k),2)=0;
                house(lp(1,k),lp(2,k),3)=0;
            end
        end
    end
end
figure
imshow(house),title('Hough');
