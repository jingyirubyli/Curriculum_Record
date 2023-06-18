%MATLAB-Homework Nr.4-3
%student name: LI JINGYI  Student Nr: r2295014 
clear
format compact, format short

mc_step=[10,100,1000,10000,100000,1000000,10000000];  %N
num=1:length(mc_step);

cal_pi=[];
for d=2:5;
for i =1:length(mc_step)
    n_inside=zeros(mc_step(i),1);
    i_inside=0;
    for i_mc=1:mc_step(i)
        x=rand(1,d);
        if sum(x.*x)<=1
            i_inside=i_inside+1;
        end
        n_inside(i_mc)=i_inside;
    end
end
    cal_pi=[cal_pi,2^d*i_inside/mc_step(i)];
    relative_error=abs(pi-cal_pi)./pi;
end

hold on
plot(d,cal_pi,'linewidth',2)
hold on
plot(d,relative_error,'linewidth',2)
hold on
legend('MC-coefficient-Value','Relative-error','Location','best')

return



