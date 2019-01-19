function [x,y] = points_title(x,y)

%write x,y values on scatter plot
x_str = num2str(x);
y_str = num2str(y);
point_str = strcat('(',x_str,',',y_str,')');
dx = 0.1; dy = 0.1; % displacement so the text does not overlay the data points
text(x+dx, y-dy, point_str);
end

