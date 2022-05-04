clear all;clc

a = imread('Cameraman256.png');

subplot(2,3,1);%ԭͼ
imshow(a);
title('ԭͼ');

x = 2:255;
y = x;
a = double(a);

%% ˮƽ����
gx(x,y) = a(x+1,y+1) + 2*a(x,y+1) + a(x-1,y+1) - a(x+1,y-1) - 2*a(x,y-1) -a(x-1,y-1);%ˮƽ����
gx1 = gx;%ˮƽ������ֵ�ָ�
for i=1:255
    for j=1:255
        if gx1(i,j)>-120 && gx1(i,j)<120
            gx1(i,j) = 90;
        end
    end
end
subplot(2,3,2);
imshow(uint8(gx1));
title('ˮƽ����ģ��ָ�');

%% ��ֱ����
gy(x,y) = a(x-1,y-1) + 2*a(x-1,y) + a(x-1,y+1) - a(x+1,y+1) - 2*a(x+1,y) - a(x+1,y-1);
gy1 = gy;%ˮƽ������ֵ�ָ�
for i=1:255
    for j=1:255
        if gy1(i,j)>-120 && gy1(i,j)<120
            gy1(i,j) = 90;
        end
    end
end
subplot(2,3,3);
imshow(uint8(gy1));
title('��ֱ����ģ��ָ�');


%% ����������
g = gx.^2 + gy.^2;
g = sqrt(g);
subplot(2,3,4);


g = uint8(abs(g));%��ֵ��
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
title('����������������ͼ��');

subplot(2,3,5);
g = abs(gx) + abs(gy);
g = uint8(abs(g));%��ֵ��
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
title('һ��������������ͼ��');

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

g = uint8(abs(g));%��ֵ��
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
title('���������������ͼ��');





