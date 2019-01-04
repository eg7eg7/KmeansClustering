function [Clusters, cluster_changes] = clusterWeightCalc(INDX,DataMATRIX, prev_cluster_changes)

%   Clusters is weight matrix - n rows (dimension) and K columns (number of clusters)
%   cluster_changes is the percentage of change the weights moved from
%   their previous location
%
%   INDX is the assignment vector, indicates for each datapoint it's
%   cluster
%
%   DataMATRIX is the data, rows(dimension), columns (num of data points)


[n,m] = size(INDX);
Clusters(1:m,1:K) = 0;
num_points_in_cluster(1:1,1:K) = 0;

for i = 1:m
    cluster = INDX(i);
    num_points_in_cluster(1,cluster) = num_points_in_cluster(1,cluster) + 1; 
    Clusters(:,cluster) = Clusters(:,cluster) + DataMATRIX(:,i);
end

for i=1:m
    Clusters(:,i) = Clusters(:,i)/num_points_in_cluster(1,i);
    
end

