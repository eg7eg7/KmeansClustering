function [Clusters, cluster_changes] = clusterWeightCalc(INDX,DataMATRIX, prev_clusters, K)

%   Clusters is weight matrix - n rows (dimension) and K columns (number of clusters)
%   cluster_changes is the percentage of change the weights moved from
%   their previous location
%
%   INDX is the assignment vector, indicates for each datapoint it's
%   cluster
%
%   DataMATRIX is the data, rows(dimension), columns (num of data points)


[n,m] = size(DataMATRIX);
Clusters(1:n,1:K) = 0;
% cluster_changes(1:1, 1:K) = 0;
num_points_in_cluster(1:1,1:K) = 0;

for i = 1:m
    clusterIndex = INDX(i);
    num_points_in_cluster(1,clusterIndex) = num_points_in_cluster(1,clusterIndex) + 1;
    Clusters(:,clusterIndex) = Clusters(:,clusterIndex) + DataMATRIX(:,i);
end

% TODO need to be fixed

for i=1:n
    Clusters(:,i) = Clusters(:,i)/num_points_in_cluster(1,i);
    
%     cluster_row(1:size(DataMATRIX,1), 1:1) = 0;
    
%     for j=1:m
%         %there is problem in this inner loop. prev_cluster_cell_value and
%         %new_cluster_cell_value get relevant cell value only through first
%         %iteration
%         prev_cluster_cell_value = prev_clusters(j:i);
%         new_cluster_cell_value = Clusters(j:i);
%         cluster_change = abs(prev_cluster_cell_value/new_cluster_cell_value);
%         cluster_row(j) = cluster_change;
%     end
%     cluster_row = cluster_row*100;
%     %perform average
%     cluster_changes(1, i) = mean(cluster_row(j,:));
end
cluster_changes_matrix = abs(Clusters-prev_clusters);
% cluster_changes_matrix = cluster_changes_matrix *100;
cluster_changes = sum(sum(cluster_changes_matrix));
cluster_changes = cluster_changes / (n*K);
disp('print');
