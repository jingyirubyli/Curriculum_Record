%MATLAB-Homework Nr.2-7
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

random_v=rand(1,20); %uniformly distributed random number
diff(random_v);      %check if equally distributed(validated)
descend_sort=fliplr(sort(random_v)) 

return