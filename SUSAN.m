clear 
close all
clc

img=imread('Cameraman256.png');
[m,n]=size(img);
subplot(1,2,1);
imshow(img);
title('原图');

%计算初始响应值
img_gray=double(img);
t=60;    %差值阈值
g=2*37/4+1;%排除噪声阈值
R=zeros(m,n);
for i=4:m-3
   for j=4:n-3
      tmp=img_gray(i-3:i+3,j-3:j+3);
      usan=0;
      for p=1:7
         for q=1:7
            if (p-4)^2+(q-4)^2<12
               if abs(img_gray(i,j)-tmp(p,q))<t
                  usan=usan+1; 
               end
            end
         end
      end
      if usan<g
         R(i,j)=g-usan; 
      end
   end
end

%非极大值抑制
tr=5;
res = zeros(m,n);
for i=tr+1:m-tr
    for j=tr+1:n-tr
        tmp=R(i-tr:i+tr,j-tr:j+tr);
        tmp(tr+1,tr+1)=0;
        if(R(i,j)>max(tmp(:)))
            res(i,j)=1;
        end
    end
end

[x,y]=find(res);
subplot(1,2,2);
imshow(img);
title('检测结果');
hold on
plot(y,x,'rx','MarkerSize',9);
hold off
