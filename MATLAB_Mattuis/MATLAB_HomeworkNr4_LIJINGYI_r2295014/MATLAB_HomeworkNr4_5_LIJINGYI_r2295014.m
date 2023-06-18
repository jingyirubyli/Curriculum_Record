%MATLAB-Homework Nr.4-5
%student name: LI JINGYI  Student Nr: r2295014 
clear
format compact, format short

% randi([a,b],m,n)  m*n matrix
% randi([1,5])   one integer

disp(['Welcome to MONTY HALL!'])

n=100000000;   %repeat
dntchange_win = 0; % 
change_win=0;
lose = 0;

for i=1:n
    treasure_sq=randi([1,3]);    % where is the TREASURE
    choice_sq=randi([1,3]);     % where is the choice
    change=randi([0,1]);  % if change=0,dntchange; if change=1,dchange

    if treasure_sq==choice_sq
        if change==0
            dntchange_win=dntchange_win+1;
        else
            change_win=change_win+1;
        end
    else

        if change==0
            lose=lose+1;
        else %change==1
                change_win=change_win+1;
        end
    end
end

    disp(['Possibility when do not change:',num2str(dntchange_win/n)]);
    disp(['Possibility when do change:',num2str(change_win/n)]);
    disp(['Possibility of lose:',num2str(lose/n)]);