clear
% Experience 2

N=510;
M=765;
X=zeros(N,M,10);

for i=0:9
      X(:,:,i+1)= double(fitsread("BIASCCD\000"+num2str(i)+".FIT"));
end
figure(1)
imshow(X(:,:,1))

m = zeros([1 10]);

for i = 1:10
   ma = X(:,:,i);
   m(i) = mean(ma(:)); 
end

figure(2)
plot(m);
grid on
grid minor
ylabel("Image Average (ADU)")
xlabel("Exposition Time (s)")
title("DARK Graph");