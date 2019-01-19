function change  = calcClusterChanges(prev_Clusters, Clusters)
%find change between previous and current cluster

[n,m] = size(Clusters);

changes_matrix=abs(Clusters-prev_Clusters);

sum_num=sum(sum(changes_matrix));
change = sum_num/(n*m);

