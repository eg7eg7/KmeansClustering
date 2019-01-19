function [Clusters,INDX, Err]=CalcKmeans(DataMATRIX , K , Thrsh ,maxITER )


%                  | EDEN DUPONT | DANIIL ROLNIK | EDEN SHARONI |
%                              AFEKA COLLEGE - 2019
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

err_max_change = 0.0003;
min_cluster_change = 0.001;
if isempty(Thrsh)
    Thrsh = 1;
end

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
%cluster_changes(1:1,1:maxITER)=0;

for i=1:K
    INDX(1,i)=i;
    column = DataMATRIX(:,i);
    Clusters(:,i)=column;
end

for iterations=1:maxITER
    DistanceMatrix = calculateDistances(DataMATRIX,Clusters);
    INDX = assignClosest(DistanceMatrix);
    Err(1,iterations)=calcError(INDX,DistanceMatrix);
    prev_Clusters = Clusters;
    Clusters = clusterWeightCalc(INDX,DataMATRIX, K);
    
    if((iterations ~= 1))
        cluster_change = calcClusterChanges(prev_Clusters, Clusters);
        if(cluster_change <= min_cluster_change)
            disp("reached minimum cluster change " + cluster_change + " of " + min_cluster_change);
            return;
        end
        %%
        this_err=Err(1,iterations);
        prev_err=Err(1,iterations-1);
        err_percent_change = 100*abs(this_err-prev_err)/this_err;
        err_change = abs(this_err-prev_err);
        
        if(err_percent_change < Thrsh || err_change < err_max_change)
            disp("reached Threshold, percentage changed " + err_percent_change + " of " +Thrsh);
            disp("error changed by " + err_change + " max is " + err_max_change)
            return;
        end
        
    end
    
end
disp("reached max iterations");
