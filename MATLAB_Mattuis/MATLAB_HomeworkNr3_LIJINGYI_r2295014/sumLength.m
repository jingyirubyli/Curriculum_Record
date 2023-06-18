function [lgt]=sumLength(x,y)
for i=1:311
    delta_x=x(i+1)-x(i);
    delta_y=y(i+1)-y(i);  
    indiv_len=(delta_y)^2+(delta_x)^2;
    lgt=sum(indiv_len);
end
end
