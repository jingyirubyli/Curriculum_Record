%MATLAB-Homework Nr.6-2
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format long

%%%%%%%%%%% Taylor
syms x
f = exp(x);
f5_taylor=taylor(f)
f10_taylor=taylor(f,'order',10)
para_origin=[-10:10];
f5_taylor_col=subs(f5_taylor,x,para_origin);
f10_taylor_col=subs(f10_taylor,x,para_origin);

%%%%%%%%%%% Euler
back_euler=exp(1).^(para_origin);
integar_euler=floor(back_euler);
integar_taylor5=floor(f5_taylor_col);
integar_taylor10=floor(f10_taylor_col);
not_integar_taylor5=f5_taylor_col-floor(f5_taylor_col);
not_integar_taylor5=double(f5_taylor_col-floor(f5_taylor_col));
not_integar_taylor10=f10_taylor_col-floor(f10_taylor_col);
not_integar_taylor10=double(f10_taylor_col-floor(f10_taylor_col));
f5_euler_col=integar_euler+not_integar_taylor5;
f10_euler_col=integar_euler+not_integar_taylor10;

%%%%%%%%%%% Plot
subplot(2,2,1)
plot(para_origin,f5_taylor_col,para_origin,f5_euler_col,'LineWidth',2)
legend('f5 taylor col','f5 euler col')
title('f5')
% str1=num2str(f5_taylor_col);text(para_origin,f5_taylor_col,str1);
hold on
subplot(2,2,2)
plot(para_origin,f10_taylor_col,para_origin,f10_euler_col,'LineWidth',2)
legend('f10 taylor col','f10 euler col')
title('f10')

%%%%%%%%%%% MATLAB exp
matlab_exp=[];
for i=-10:10
    matlab_exp=[matlab_exp,exp(i+1)];
    i=i+1;
end
string(matlab_exp);  % check

%%%%%%%%%%% Compare
taylor5_error=abs(f5_taylor_col-matlab_exp);
taylor10_error=abs(f10_taylor_col-matlab_exp);
euler5_error=abs(f5_euler_col-matlab_exp);
euler10_error=abs(f10_euler_col-matlab_exp);
comp_taylor5=abs(taylor5_error./matlab_exp);
comp_taylor10=abs(taylor10_error./matlab_exp);
comp_euler5=abs(euler5_error./matlab_exp);
comp_euler10=abs(euler10_error./matlab_exp);
subplot(2,2,3)
plot(para_origin,taylor5_error,para_origin,taylor10_error,'LineWidth',2)
% errorbar(para_origin,taylor5_error,comp_taylor5)
legend('taylor5 error exp','taylor10 error exp')
title('error-taylor')
subplot(2,2,4)
plot(para_origin,euler5_error,para_origin,euler10_error,'LineWidth',2)
legend('euler5 error exp','euler10 error exp')
title('error-euler')
% set(gca)

return


