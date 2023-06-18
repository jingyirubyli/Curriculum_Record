%MATLAB-Homework Nr.2
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short
%
%Program
%

n = 20;
L = 0; R = 0;
for i = 1:n, 
    L = i+L;
    R = i*(i+1)/2;
    disp(L);
    fprintf('%c', 8); %delete the Enter/Line break
    disp(R);
end

return
