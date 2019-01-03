function [Clusters,INDX, Err, DistanceMatrix]=CalcKmeans(DataMATRIX , K , Thrsh ,maxITER )
%% NOTE FOR LATER
%REMOVE 4TH RETURNED VALUE

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

if isempty(Thrsh)
  Thrsh = 1;
end;

if isempty(maxITER)
  maxITER = 5;
end;


% m - Dimension, n - data size
[m,n] = size(DataMATRIX);

%initializes data frames into random clusters
INDX = randi(K,1,n);
Clusters(1:m,1:K) = 0;

for i=1:K
    INDX(1,i)=i;
    column = DataMATRIX(:,i);
    Clusters(:,i)=column;
end
for iterations=1:maxITER
%% 2-Calculate distance for each datapoint to each cluster and assign to
%% closest cluster center

DistanceMatrix = calculateDistances(DataMATRIX,Clusters);
INDX = assignClosest(DistanceMatrix);

%% 3- Calculate error - defined to be the average distance of a node to it's
%% parent
Err=calcError(INDX,DistanceMatrix);
%% 4 - Calculate average for each dimension using data points in clusters and
%% refresh K co-ordinates
end
%% repeat 2, 3 and 4 until halting criteria is met:
% a. no cluster is changed
%
% b. max iterations reached
%
% c. changes in cluster centers are minor
%
% d. The change in error rate is under a certain percentage OR the error
% rate is under the minimum value


% Question #2
% A1 = (2,10) ; A2 = (2,5) ; A3 = (8,4) ; A4 = (5,8) ; A5 = (7,5) ;
% A6 = (6,4) ; A7 = (1,2) ; A8 = (4,9) 
A = [2 10; 2 5 ; 8 4; 5 8; 7 5; 6 4; 1 2; 4 9]; % Matrix of A values