%MATLAB-Homework Nr.3-6
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short
%
%Program
%

load 'USACA.dat'

%fid=fopen('USACA.dat','r');
%data_USACA=fscanf(fid,'%g');

x=USACA(:,1);
y=USACA(:,2);
plot(x,y,'.','MarkerSize',10)
hold on

for i=1:311
    co_x=[x(i),x(i+1)];
    co_y=[y(i),y(i+1)];
    plot(co_x,co_y,'b-','Linewidth',0.5)
hold on
end

last=[x(311),x(1)];
first=[y(311),y(1)];

lgt_USACA=sumLength(x,y)

return

%%%%%%function%%%%%%
function [lgt]=sumLength(x,y)
for i=1:311
    delta_x=x(i+1)-x(i);
    delta_y=y(i+1)-y(i);  
    indiv_len=(delta_y)^2+(delta_x)^2;
    lgt=sum(indiv_len);
end
end
