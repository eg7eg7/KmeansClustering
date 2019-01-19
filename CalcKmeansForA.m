function [Clusters,INDX, Err]=CalcKmeansForA(DataMATRIX , Thrsh ,maxITER )
K=3;
maxITER=3;

%                  |EDEN DUPONT | DANIIL ROLNIK | EDEN SHARONI |
%                                 AFEKA COLLEGE
%   Inputs
%    K - the number of clusters
%
%    Thrsh - the minimum error in percentage -
%    100*(Err(N)-Err(N-1))/(Err(N)) < Thrsh_value
%
%    maxITER - the maximum iterations the function will do if not
%    satisfied by other measures
%
%   Outputs
%           Err - vector of errors for each iteration
%
%           Clusters - the calculated weight matrix of K (K columns, m lines)
%
%           INDX is N size vector, which maps the centroid points into clusters

%Thrsh = 100*(Err(N)-Err(N-1))/(Err(N))


if isempty(maxITER)
    maxITER = 5;
end


% m - Dimension, n - data size
[m,n] = size(DataMATRIX);
if(K>n)
    K=n;
    disp("data given is too little for such clustering, K changed to " + n);
    disp("K="+n+"");
end

%initializes data frames into random clusters
INDX = randi(K,1,n);
Clusters(1:m,1:K) = 0;

Err(1:1,1:maxITER)=0;

indexes = [1,4,7];
[t,p] = size(indexes);

for i=1:p
    j=indexes(i);
    INDX(1,j)=i;
    column = DataMATRIX(:,j);
    Clusters(:,i)=column;
end

%draw scatter plot with initialized values
draw_points(DataMATRIX, Clusters, INDX,'After Initialization');

for iterations=1:maxITER
    DistanceMatrix = calculateDistances(DataMATRIX,Clusters);
    INDX = assignClosest(DistanceMatrix);
    Err(1,iterations)=calcError(INDX,DistanceMatrix);
    Clusters = clusterWeightCalc(INDX,DataMATRIX, K);
    
    %draw plot after every iteration
    draw_points(DataMATRIX, Clusters, INDX, strcat('Iteration #', num2str(iterations)));
    
end
disp("reached max iterations");