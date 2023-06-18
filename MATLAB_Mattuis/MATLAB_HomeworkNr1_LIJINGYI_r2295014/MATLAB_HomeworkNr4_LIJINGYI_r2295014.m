%MATLAB-Homework Nr.4
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short
%
%Program
%

k=input('please input the size:');
%the matrix will be k*k
format rat 
A = zeros(k,k);
for m = 1:k
    for n = 1:k
        A(m,n) = 1/(m+n-1);
    end
end
A  %my result
B = hilb(k) %MATLAB's myhilb

%Compare and present
t = isequal(A,B);
if t == 1
    disp('Equal')
else
    disp('Unequal')
end

return
