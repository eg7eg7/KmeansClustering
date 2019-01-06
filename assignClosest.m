function INDX = assignClosest(DistanceMatrix)
[m,n] = size(DistanceMatrix);
INDX(1:1,1:m) = 0;

for i=1:m
    minDist=DistanceMatrix(i,1);
    closestCluster=1;
    for j=1:n
        dist = DistanceMatrix(i,j);
        if(dist<minDist)
            minDist=dist;
            closestCluster=j;
        end
    end
    INDX(1,i)=closestCluster;
end