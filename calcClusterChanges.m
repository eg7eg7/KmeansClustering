function change  = calcClusterChanges(prev_Clusters, Clusters)



[n,m] = size(Clusters);
changes_matrix=abs(Clusters-prev_Clusters);

        %there is problem in this inner loop. prev_cluster_cell_value and
        %new_cluster_cell_value get relevant cell value only through first
        %iteration-
            
        
sum_num=sum(sum(changes_matrix));
 change = sum_num/(n*m);       
        
