%MATLAB-Homework Nr.2-2
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

matrix_Rosser=rosser;
matrix_Hilbert=invhilb(8);

compare_represent=matrix_Rosser > matrix_Hilbert;
%compare the elements one by one

position_index=find(matrix_Rosser > matrix_Hilbert);    
%the position of the elements of Rosser larger than Hilbert

larger_ele=matrix_Rosser(position_index)
%find the elements by position

return