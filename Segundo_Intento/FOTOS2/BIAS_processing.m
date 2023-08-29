clear
% Experience 2

N=480;
M=640;
p="BIAS\BIAS_D_G500\2023-08-24-1905_3-U-L-Test_000";

X=zeros(N,M,10);
for i=0:9
    X(:,:,i+1)=imread(p+num2str(i)+".jpg");
end 

Master=mean(X,3);
imshow(Master,[0,255])
figure(1)