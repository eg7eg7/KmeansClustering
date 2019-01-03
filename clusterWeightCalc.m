function [Clusters, cluster_changes] = clusterWeightCalc(INDX,DataMATRIX)

%   Clusters is weight matrix - n rows (dimension) and K columns (number of clusters) 
%   cluster_changes is the percentage of change the weights moved from
%   their previous location
%
%   INDX is the assignment vector, indicates for each datapoint it's
%   cluster
%
%   DataMATRIX is the data, rows(dimension), columns (num of data points)