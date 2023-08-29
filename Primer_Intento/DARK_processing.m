clear
% Experience 2

N=480;
M=640;
X=zeros(N,M,10,12);
Master=zeros(N,M,12);


prueba = im2gray(imread("DARK\DARK"+num2str(1)+"\000"+num2str(0)+".jpg"));
for i=1:12
    for j=0:9
        X(:,:,j+1,i)=imread("DARK\DARK"+num2str(i)+"\000"+num2str(j)+".jpg");
        X(:,:,j+1,i) = X(:,:,j+1,i);
    end
    Master(:,:,i)=mean(X(:,:,:,i),3);
end 
figure(1)
imshow(Master(:,:,5),[0,255])

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
title("DARK Graph");