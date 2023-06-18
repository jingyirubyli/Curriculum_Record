%MATLAB-Homework Nr.3-1
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

n=4;
[X,Y]=meshgrid(1:n);
plot(X,Y,'kx','Markersize',12,'Linewidth',2)
xlabel('X')
ylabel('Y')

for i=1:length(X)
     for j=1:length(Y)
          %j_motified=5/2*[1+(-1)^(i-1)]+(-1)^(i)*j;  Z-Sque
      text(i+0.1,j,num2str(n*(i-1)+j))
     end
 end
hold on

return