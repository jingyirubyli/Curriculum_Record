%MATLAB-Homework Nr.4-1/2
%student name: LI JINGYI  Student Nr: r2295014 
clear
format compact, format short

mc_step=[10,100,1000,10000,100000,1000000,10000000];  %N
num=1:length(mc_step);

cal_pi=[];cal_cp_pi=[];
% abs_accuracy=[];
% theoretical_percentage=[];
for i =1:length(mc_step)
    n_inside=zeros(mc_step(i),1);
    n_sqr=zeros(mc_step(i),1);
    i_inside=0;i_cp_inside=0;
    for i_mc=1:mc_step(i)
        x=rand;xx=randn;
        y=rand;yy=randn;
        r_2=x*x+y*y;r_cp_2=xx*xx+yy*yy;    % cp---->randn
        if r_2<=1
            i_inside=i_inside+1;
        end
        if r_cp_2<=1
            i_cp_inside=i_cp_inside+1;
        end
        n_sqr(i_mc)=i_mc;
        n_inside(i_mc)=i_inside;
        n_cp_inside(i_mc)=i_cp_inside;
    end

%   cal_pi=4*i_inside/mc_step(i) %MC-value
    cal_pi=[cal_pi,4*i_inside/mc_step(i)];
    cal_cp_pi=[cal_cp_pi,4*i_cp_inside/mc_step(i)];
%     abs_accuracy=abs(pi-cal_pi);
%     abs_cp_accuracy=abs(pi-cal_cp_pi);
    theoretical_percentage=abs(pi-cal_pi)./pi;
    theoretical_cp_percentage=abs(pi-cal_cp_pi)./pi;
end

comp=1./sqrt(mc_step);
plot(num,comp,'linewidth',2)
hold on
plot(num,cal_pi,'linewidth',2)
hold on
% plot(num,abs_accuracy,'linewidth',2)
% hold on
plot(num,theoretical_percentage,'linewidth',2)
hold on
legend('1/sqrt(N)','MC-pi-Value','Theoretical-error-percentage','log','Location','best')

figure
plot(log(mc_step),log(theoretical_percentage),log(mc_step),log(theoretical_cp_percentage),'linewidth',2)
legend('log(rela-error)','log(rela-cp-error)')
hold on


return



