%MATLAB-Homework Nr.6-3
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format long

%%%%%%%%%%% quadgk
a=10;b=1;
ee=sqrt(a^2-b^2)/a;
f=@(theta) sqrt(1-ee.^2*(sin(theta)).^2) ;
perimeter=4*a*quadgk(f,0,pi/2)
Approx_1=44.65;
Approx_2=40.606;
Approx_3=40.639;
Series_1=43.204;
Series_2=40.623;
mathisfun=[Approx_1,Approx_2,Approx_3,Series_1,Series_2];
compare=[];
for i=1:length(mathisfun)
    compare=[compare,perimeter-mathisfun(i)];
    i=i+1;
end
compare;

plot([1:5],abs(compare)/perimeter)
position=find(abs(compare)==min(abs(compare)));
best_pe=mathisfun(position);
disp(['Since the actual perimeter=',num2str(perimeter),'.The most correct one is ','Approx_',num2str(position),'=',num2str(best_pe)])

%%%%% trapz
set1=linspace(0,pi/2,20); 
set2=linspace(0,pi/2,200);   % set1=20;set2=200;
y=sqrt(1-ee.^2*(sin(set1)).^2) ;
z=trapz(set1,y)*4*a;
% z=pi/40*trapz(y)*4*a    another calculation method

%%%% visualize 20
theta_end1=[];
terminal1=[];y1=[];
ori_perimeter_set1=[];
for slice_1=1:20
   theta_end1=0:pi/2/20:pi/2/20*slice_1; 
   y1=sqrt(1-ee.^2*(sin(theta_end1)).^2) ;
   terminal1=[terminal1,trapz(theta_end1,y1)*4.*a];
   ori_perimeter_set1=[ori_perimeter_set1,4*a*quadgk(f,0,theta_end1(end))];
   slice_1=slice_1+1;
end

subplot(2,1,1)
perimeter_set1=[ori_perimeter_set1,perimeter];
b1=bar(set1,terminal1)
hold on
% plot(theta_end1,perimeter_set1,'c','LineWidth',1.5)
plot(theta_end1,[terminal1,perimeter],'c','LineWidth',1.5)
xlabel('theta')
ylabel('Perimeter-20-p')
grid on
xtips1 = b1.XEndPoints;
ytips1 = b1.YEndPoints;
labels1 = string(b1.YData); 
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','fontsize',7)
title('trapz-20-p')

%%%% visualize 200
subplot(2,1,2)
theta_end2=[];
terminal2=[];
ori_perimeter_set2=[];
for slice_2=1:200
   theta_end2=0:pi/2/200:pi/2/200*slice_2; 
   y2=sqrt(1-ee.^2*(sin(theta_end2)).^2) ;
   terminal2=[terminal2,trapz(theta_end2,y2)*4.*a];
   ori_perimeter_set2=[ori_perimeter_set2,4*a*quadgk(f,0,theta_end2(end))];
   slice_2=slice_2+1;
end
perimeter_set2=[ori_perimeter_set2,perimeter];
b2=bar(set2,terminal2)
hold on
% plot(theta_end2,perimeter_set2,'c','LineWidth',1.5)
plot(theta_end2,[terminal2,perimeter],'c','LineWidth',1.5)
xlabel('theta')
ylabel('Perimeter-200-p')
grid on
xtips2 = b2.XEndPoints;
ytips2 = b2.YEndPoints;
labels2 = string(b2.YData); 
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','fontsize',2)
title('trapz-200-p')

%%%% check the digits (display enough digits,though format long-15 digits is OK)
digit1=vpa(perimeter,40)
digit2=vpa(terminal1(end),40)
digit3=vpa(terminal2(end),40)

digit_noequal_20p=[];digit_noequal_200p=[];
for n=1:40
    if strncmp(char(digit1),char(digit2),n)==1
    n=n+1;
    else
    digit_noequal_20p=[digit_noequal_20p,n];
    end
    if strncmp(char(digit1),char(digit3),n)==1
    n=n+1;
    else
    digit_noequal_200p=[digit_noequal_200p,n];
    end
end

fprintf('The number of digits agree between quadgk and trapz-20 points')
digit_noequal_20p(1)-4    %% -4=-3-1
fprintf('The number of digits agree between quadgk and trapz-200 points')
digit_noequal_200p(1)-4

return
