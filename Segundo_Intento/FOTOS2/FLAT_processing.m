%% Procesamiento para curva de FLAT
clear
% Experience 2

N=480;
M=640;
X=zeros(N,M,10,12);
Master=zeros(N,M,12);

for i=1:12
    for j=0:9
        X(:,:,j+1,i)=imread("FLAT\FLAT"+num2str(i)+"\000"+num2str(j)+".jpg");
    end

    Master(:,:,i)=mean(X(:,:,:,i),3);
end 

figure(1)
imshow(Master(:,:,12),[0,255]);

m = zeros([1 12]);

for i = 1:12
   ma = Master(:,:,i);
   m(i) = mean(ma(:)); 
end

figure(2)
plot(m);
grid on
grid minor
ylabel("Image Average (ADU)")
xlabel("Exposition Time (s)")
title("FLAT Graph");

%% Procesamiento para Factor de Conversión
i = 10;
f1 =imread("FLAT\FLAT"+num2str(i)+"\000"+num2str(0)+".jpg");
f2 =imread("FLAT\FLAT"+num2str(i)+"\000"+num2str(1)+".jpg");
mu = mean(f1(:));

figure(1)
subplot(1,2,1)
imhist(f1)
grid on
grid minor
subplot(1,2,2)
imhist(f2)
grid on
grid minor

f3 = f2 - f1;

figure(2)
imhist(f3)
grid on
grid minor
[count,bins] = imhist(f3);

figure(3)
stem(count)
count_r = flip(count);

figure(4)
stem(count_r)

centered = [count_r;count(2:end)];

x = 1:511;
x = x';
figure(5)
stem(centered)


mS = sum(centered .* x) / sum(centered);
stdS = sqrt(sum(centered.*(x-mS).^2)/sum(centered));

alpha = (stdS^2)/(mu)

