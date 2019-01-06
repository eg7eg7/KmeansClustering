function change  = calcClusterChanges(prev_Clusters, Clusters)
change = 100;



%     cluster_row(1:size(DataMATRIX,1), 1:1) = 0;
    
%     for j=1:m
%         %there is problem in this inner loop. prev_cluster_cell_value and
%         %new_cluster_cell_value get relevant cell value only through first
%         %iteration
%         prev_cluster_cell_value = prev_clusters(j:i);
%         new_cluster_cell_value = Clusters(j:i);
%         cluster_change = abs(prev_cluster_cell_value/new_cluster_cell_value);
%         cluster_row(j) = cluster_change;
%     end
%     cluster_row = cluster_row*100;
%     %perform average
%     cluster_changes(1, i) = mean(cluster_row(j,:));

%cluster_changes_matrix = abs(Clusters-prev_Clusters);
% cluster_changes_matrix = cluster_changes_matrix *100;
%cluster_changes = sum(sum(cluster_changes_matrix));
%cluster_changes = cluster_changes / (n*K);