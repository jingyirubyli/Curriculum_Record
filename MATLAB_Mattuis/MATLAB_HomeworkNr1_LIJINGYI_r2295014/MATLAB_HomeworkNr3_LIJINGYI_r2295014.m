%MATLAB-Homework Nr.3
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short
%
%Program
%

F(1)=0;F(2)=1;
%F refers to Fibonacci

n=input('please input n:');
%the result will be the sequence until n(th)

for i=3:n
    F(i)=F(i-1)+F(i-2);     %variable 1: a = F(i-1)
                            %variable 2: b = F(i-2)
end
disp(F);

return
