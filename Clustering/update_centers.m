function C = update_centers(X, C, a)
    
    %Number of clusters
    k = size(C,1);
    
    for i = 1:k
        
        %Find all points in cluster 'i'
        points_cluster = X(find(a == i),:);
        
        %Optimal center --> Mean
        C(i,:) = mean(points_cluster,1);
    end


end
