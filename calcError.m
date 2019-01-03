function Err=calcError(INDX,DistanceMatrix)

[n,datapoints] = size(INDX);
[datapoints2,K] = size(DistanceMatrix);

sumDistance = 0;
for i=1:datapoints
cluster = INDX(1,i);
sumDistance = sumDistance + DistanceMatrix(i,cluster);
end

Err = sumDistance/datapoints;