function [] = display_cluster(X, a, C, num_clusters)

for k = 1:num_clusters
    
    %Find all points from cluster 'i'
    pointsInCluster = find(a==k);
    
    scatter(X(pointsInCluster,1),X(pointsInCluster,2))
    hold on
    
end