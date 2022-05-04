clear all;clc

a = imread('Cameraman256.png');

subplot(2,3,1);%原图
imshow(a);
title('原图');

x = 2:255;
y = x;
a = double(a);

%% 水平方向
gx(x,y) = a(x+1,y+1) + 2*a(x,y+1) + a(x-1,y+1) - a(x+1,y-1) - 2*a(x,y-1) -a(x-1,y-1);%水平方向
gx1 = gx;%水平方向阈值分割
for i=1:255
    for j=1:255
        if gx1(i,j)>-120 && gx1(i,j)<120
            gx1(i,j) = 90;
        end
    end
end
subplot(2,3,2);
imshow(uint8(gx1));
title('水平方向模板分割');

%% 垂直方向
gy(x,y) = a(x-1,y-1) + 2*a(x-1,y) + a(x-1,y+1) - a(x+1,y+1) - 2*a(x+1,y) - a(x+1,y-1);
gy1 = gy;%水平方向阈值分割
for i=1:255
    for j=1:255
        if gy1(i,j)>-120 && gy1(i,j)<120
            gy1(i,j) = 90;
        end
    end
end
subplot(2,3,3);
imshow(uint8(gy1));
title('垂直方向模板分割');


%% 索贝尔算子
g = gx.^2 + gy.^2;
g = sqrt(g);
subplot(2,3,4);


g = uint8(abs(g));%二值化
for i=1:255
    for j=1:255
        if g(i,j)>180
            g(i,j) = 255;
        else
            g(i,j) = 0;
        end
    end
end

imshow(uint8(g));
title('二范数索贝尔算子图像');

subplot(2,3,5);
g = abs(gx) + abs(gy);
g = uint8(abs(g));%二值化
for i=1:255
    for j=1:255
        if g(i,j)>180
            g(i,j) = 255;
        else
            g(i,j) = 0;
        end
    end
end
imshow(uint8(g));
title('一范数索贝尔算子图像');

subplot(2,3,6);

gx = abs(gx);
gy = abs(gy);
for i=1:255
    for j=1:255
        if(gx(i,j)>=gy(i,j))
            g(i,j) = gx(i,j);
        else
            g(i,j) = gy(i,j);
        end
    end
end

g = uint8(abs(g));%二值化
for i=1:255
    for j=1:255
        if g(i,j)>180
            g(i,j) = 255;
        else
            g(i,j) = 0;
        end
    end
end
imshow(uint8(g));
title('无穷范数索贝尔算子图像');





