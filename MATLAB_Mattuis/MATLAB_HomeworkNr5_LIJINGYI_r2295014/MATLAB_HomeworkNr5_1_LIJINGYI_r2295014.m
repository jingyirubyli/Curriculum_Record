%MATLAB-Homework Nr.5-1
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

n=0:0.1:10;     %sample
complex_exp=exp(1j*n);                  
L=length(n);
%%%%%%3D%%%%%%
x=n;                     
y=imag(complex_exp);                   
z=real(complex_exp);                    
y_0=zeros(size(n));            %y=0  
y_1=ones(size(n));             %y=1
z_0=zeros(size(n));            %z=0
z_1=ones(size(n));             %z=1
%%%%%%%Draw%%%%%%
plot3(x,y,z,'.b');             
hold on
grid on
x1=[x;x];
y1=[y;y_0];
z1=[z;z_0];
% link
for i=1:L                      
  plot3(x1(:,i),y1(:,i),z1(:,i),'b');  
end
%center axis
plot3(x,y_0,z_0,'k');  
ylabel('Imaginary')
zlabel('Real')
% Real
plot3(x,y,-1*z_1,'.g');   
y2=[y;y_0];
z2=[-1*z_1;-1*z_1];
for i=1:L                      
   plot3(x1(:,i),y2(:,i),z2(:,i),'g');  
end
% Imaginary
plot3(x,y_1,z,'.r');
y3=[y_1;y_1];
z3=[z;z_0];
for i=1:L                      
   plot3(x1(:,i),y3(:,i),z3(:,i),'r');   
end

%%%%%%Subplot
figure
subplot(1,2,1)
plot(x,y)
title('sin(z)')
subplot(1,2,2)
plot(x,z)
title('cos(z)')

return