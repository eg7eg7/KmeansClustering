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
Clusters=0;
Err=0;
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

