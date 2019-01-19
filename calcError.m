function Err=calcError(INDX,DistanceMatrix)

datapoints = size(INDX,2);

sumDistance = 0;
for i=1:datapoints
    cluster = INDX(1,i);
    sumDistance = sumDistance + DistanceMatrix(i,cluster);
end

Err = sumDistance/datapoints;