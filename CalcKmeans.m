function [Clusters,INDX, Err]=CalcKmeans(DataMATRIX , K , Thrsh ,maxITER )


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
%           INDX is N size vector, which maps the data into clusters

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


%stub - delete later
Err=0;