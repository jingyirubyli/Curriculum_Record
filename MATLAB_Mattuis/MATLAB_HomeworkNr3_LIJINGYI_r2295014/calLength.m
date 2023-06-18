function s_length = calLength(x,y)

s_length=0;
    for i=2:length(x)
        s_length=s_length+sqrt((x(i)-x(i-1))^2+(y(i)-y(i-1))^2);
    end

% if mod(n,2) == 0
%    s_length = n*d;
% else
%    s_length = (n-1+sqrt(2))*d;
% end

end
