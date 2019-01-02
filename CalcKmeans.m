function [Clusters,INDX, Err]=CalcKmeans(DataMATRIX , K , Thrsh ,maxITER )


%                   EDEN DUPONT AFEKA COLLEGE
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
  return
end
