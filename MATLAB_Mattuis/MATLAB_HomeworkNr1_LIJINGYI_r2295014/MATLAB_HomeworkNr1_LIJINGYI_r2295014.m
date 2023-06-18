%MATLAB-Homework Nr.1
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short
%
%Program
%

n=input('please input n:');
%the result until mutipled n

N=1;
for i=n:-1:1
    N=N*i;

end
disp(N)
return