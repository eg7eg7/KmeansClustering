function DistanceMatrix = calculateDistances(DataMATRIX,Clusters)
%Calculates distance for each data point to each cluster K, returns matrix
%of distances 
%K Columns and n rows

[m,n] = size(DataMATRIX);

DistanceMatrix(1:n,1:m) = 0;

for i=1:n
    for j=1:m
        DistanceMatrix(i,j) = CalcDistanceBetweenVectors(DataMATRIX(:,i),Clusters(:,j));
    end
end
