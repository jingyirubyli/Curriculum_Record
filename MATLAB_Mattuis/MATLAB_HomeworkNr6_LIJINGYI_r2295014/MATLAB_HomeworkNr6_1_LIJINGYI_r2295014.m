%MATLAB-Homework Nr.6-1
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

%%%%%%%%%%% base 4 + mantissa 2
j1=0;
for i1=0:1                  % 1st mantissa digit
    for i2=0:1              % 2nd mantissa digit
        for e1=-6:9      % exponent
            j1=j1+1;
            x1(j1)=(i1/2+i2/4)*2^e1;
        end
    end
end
length(x1);
x1;eps(x1);    %check float relative accuracy      

%%%%%%%%%%% base 2 + mantissa 4
j2=0;
for i1=0:1                  % 1st mantissa digit
    for i2=0:1              % 2nd mantissa digit
        for i3=0:1          % 3rd mantissa digit
            for i4=0:1          % 4rd mantissa digit
                for e2=-1:2      % exponent
                j2=j2+1;
                x2(j2)=(i1/2+i2/4+i3/8+i4/16)*16^e2;
                end
            end
        end
    end
end
length(x2);
x2;eps(x2);    %check float relative accuracy 

if length(x1)==length(x2)    %% check length
    fprintf('About the same amount of numbers.')
end

% Generate the plot
figure
subplot(2,2,1)
scatter(x1, zeros(size(x1)), 'r', '+')
xlim([min(x1) max(x1)]);
ylim([-1 1]);
title('Base 4, Mantissa 2')
subplot(2,2,3)
scatter(x2, zeros(size(x2)), 'b', '+')
xlim([min(x2) max(x2)]);
ylim([-1 1]);
title('Base 2, Mantissa 4')

subplot(2,2,2)
plot(eps(x1),'LineWidth',2)
title('base 4 + mantissa 2')
xlabel('Amount')
ylabel('Range')
subplot(2,2,4)
plot(eps(x2),'LineWidth',2)
title('base 2 + mantissa 4')
xlabel('Amount')
ylabel('Range')
fprintf('\n')      % print enter
%%%% answer
fprintf('"base 2 + mantissa 4" system is better for higher float relative accuracy.')

return