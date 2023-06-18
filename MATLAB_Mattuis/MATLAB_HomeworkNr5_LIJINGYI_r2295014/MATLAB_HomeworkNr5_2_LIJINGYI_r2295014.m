%MATLAB-Homework Nr.5-2
%student name: LI JINGYI  Student Nr: r2295014 
clear all

rgb=imread('R2D.jpg');
[m,n,g]=size(rgb);
pixel=[m,n];
%%%%%%%side
sd_leftside_start=fix(38);sd_rightside_end=fix(879);
sd_upside_start=fix(272);sd_btside_end=fix(551);
side=rgb(sd_upside_start:sd_btside_end,sd_leftside_start:sd_rightside_end,1:g);
% figure
subplot(2,2,1)
imshow(side)
%%%%%%%upper
up_leftside_start=fix(252);up_rightside_end=fix(453);
up_upside_start=fix(66);up_btside_end=fix(270);
upper=rgb(up_upside_start:up_btside_end,up_leftside_start:up_rightside_end,1:g);
% figure
subplot(2,2,2)
imshow(upper)
%%%%%%%bottom
bt_leftside_start=fix(252);bt_rightside_end=fix(453);
bt_upside_start=fix(551);bt_btside_end=fix(761);
bottom=rgb(bt_upside_start:bt_btside_end,bt_leftside_start:bt_rightside_end,1:g);
% figure
subplot(2,2,3)
imshow(bottom)
% [maxv,maxh,dummy]=size(bottom)
% c_v=100;
% c_h=100;
% r_v=100;
% r_h=100;
% for iv=1:maxv
%     for ih=1:maxh
%         dist=((iv-c_v)/r_v)^2+((ih-c_h)/r_h)^2;
%         if dist>1
%             bottom(iv,ih,:)=255;
%         end
%     end
% end

%%%%%%%cylinder
figure
[x,y,z]=cylinder(2);
z(2,:)=10;
side=flipud(side);
surf(x,y,z,'FaceColor','texturemap','EdgeColor','none','CData',side);
hold on

%%bottom
sigma = linspace(0,2*pi,101);
x_bottom=2*cos(sigma);
y_bottom=2*sin(sigma);
z_bottom=ones(101,101)-1;
bottom=flipud(bottom);
surf(x_bottom,y_bottom,z_bottom,'FaceColor','texturemap','EdgeColor','none','CData',bottom);

%%%%%%sphere
[x,y,z] = sphere;               %# Makes a 21-by-21 point sphere
x = x(11:end,:);                %# Keep top 11 x points
y = y(11:end,:);                %# Keep top 11 y points
z = z(11:end,:)+5;                %# Keep top 11 z points
r = 2;                          %# A radius value
upper=flipud(upper);
hs = surf(r.*x,r.*y,r.*z, 'FaceColor','texturemap','EdgeColor','none','CData',upper);      %# Plot the surface
axis equal;                     %# Make the scaling on the x, y, and z axes equal
hold on

%%%%%%action
slice=10;
for sn =1:slice
    alpha=0-sn;
    rotate(hs,[1,0,0],alpha,[2,2,10])
    M(sn)=getframe;
end

hold on
vx = 0;
vy = 2;
vz = 0.1;
for tt=0:0.1:1
    grid on
    dy = vy*tt-2;dx=vx*tt;
    dz = 15-9.8*tt.^2;
%     plot3(dx, dy, dz);
     comet3(dx, dy, dz);
drawnow
end
pause
axis equal
daspect([1 1 1])
view(-60,30)
hold on

return






