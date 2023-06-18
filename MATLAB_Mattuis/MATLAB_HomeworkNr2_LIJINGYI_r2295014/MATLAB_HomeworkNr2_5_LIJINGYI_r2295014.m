%MATLAB-Homework Nr.2-5
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

test_int=[1.3 1.5 -1.3 -1.5];

int_floor=floor(test_int)  %rounds element to the nearest integer less than or equal to that element
int_ceil=ceil(test_int)   %rounds element to the nearest integer greater than or equal to that element
int_round=round(test_int) %rounds element to the nearest integer. 
                          %where an element has a fractional part of exactly 0.5,
                          ...rounds away from zero to the integer with larger magnitude.
return