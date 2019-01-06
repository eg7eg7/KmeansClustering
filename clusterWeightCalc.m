function Clusters = clusterWeightCalc(INDX,DataMATRIX, K)

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
num_points_in_cluster(1:1,1:K) = 0;

for i = 1:m
    clusterIndex = INDX(i);
    num_points_in_cluster(1,clusterIndex) = num_points_in_cluster(1,clusterIndex) + 1;
    Clusters(:,clusterIndex) = Clusters(:,clusterIndex) + DataMATRIX(:,i);
end


for i=1:K
    if(num_points_in_cluster(1,i) ~= 0)
    Clusters(:,i) = Clusters(:,i)/num_points_in_cluster(1,i);
    end
end