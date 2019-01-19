function DistanceMatrix = calculateDistances(DataMATRIX,Clusters)
%Calculates distance for each data point to each cluster K, returns matrix
%of distances

%K Columns and n rows

n = size(DataMATRIX,2);
K = size(Clusters,2);
DistanceMatrix(1:n,1:K) = 0;

for i=1:n
    for j=1:K
        DistanceMatrix(i,j) = CalcDistanceBetweenVectors(DataMATRIX(:,i),Clusters(:,j));
    end
end
