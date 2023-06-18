%MATLAB-Homework Nr.4-4
%student name: LI JINGYI  Student Nr: r2295014 
clear all
format compact
format short

n=4;
[X,Y]=meshgrid(1:n);
plot(X,Y,'kx','Markersize',12,'Linewidth',2)
xlabel('X')
ylabel('Y')
% A=A+0.2*(rand(size(A))-.5)  add random dots

X=X+0.2*(rand(size(X))-.5);
Y=Y+0.2*(rand(size(Y))-.5);

for i=1:length(X)
     for j=1:length(Y)
          %j_motified=5/2*[1+(-1)^(i-1)]+(-1)^(i)*j;  Z-Sque
      text(i+0.1,j,num2str(n*(i-1)+j))
     end
 end
hold on
%%%%%%%%%%link_dot%%%%%%%%%%%%%
p_num=(1:n*n)';
index=2;     %start note
link=zeros(1,n*n+1);link(1)=1;

if rem(n,2)==0
    pick=n;
else
    pick=n-2;
end

for i=1:pick       
    if rem(i,2)==1
        for j=2:n
            link(index)=(i-1)*n+j;
            index=index+1;
        end
    else
        for j=n:-1:2
            link(index)=(i-1)*n+j;
            index=index+1;
        end
    end
end

if rem(n,2)==1
    for j=n:-1:2       
        if rem(j,2)==0
             for i=n:-1:n-1
                link(index)=(i-1)*n+j;
                index=index+1;
            end
        else
             for i=n-1:n
                link(index)=(i-1)*n+j;
                index=index+1;
            end
        end
    end
end

for i=n:-1:1         
    link(index)=(i-1)*n+1;
    index=index+1;
end

link_dot(X(link),Y(link));
s_length = calLength(X(link),Y(link))

return

%%%%%%function%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%
function link_dot(X,Y)
    for i=2:length(X)
        line([X(i-1),X(i)],[Y(i-1),Y(i)],'Color','red','LineStyle','--','LineWidth',2);
    end
end

