function draw_points(DataMATRIX,Clusters, INDX, title_str)

colors = ['r' 'g' 'b'];
[m, n] = size(DataMATRIX);

figure
axis([0 1 0 1])
for i=1:n
    [x, y] = points_title(DataMATRIX(1,i), DataMATRIX(2,i));
    scatter(x, y, colors(INDX(i)));
    hold on
end

for i=1:n
    cluster_index = INDX(i);
    [x, y] = points_title(Clusters(1,cluster_index), Clusters(2,cluster_index));
    scatter(x, y, 'filled', colors(cluster_index));
    hold on
    title(title_str);
end
hold off

    function[x,y] = points_title(x,y)
        %write x,y values on scatter plot
        x_str = num2str(x);
        y_str = num2str(y);
        point_str = strcat('(',x_str,',',y_str,')');
        dx = 0.1; dy = 0.1; % displacement so the text does not overlay the data points
        text(x+dx, y-dy, point_str);
    end
end



