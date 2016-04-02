%Loading data
load('kmeans_data')

for k = 1:20
      
    %Clustering with 'k' number of clusters
    [C,a,obj] = kmeans_cluster(X,k,'random',10);
    size(X)
    objective(k) = obj;
    
    
end

k = 1:20;

%plot k-means Objective and corresponding cluster size
plot(k, objective)
xlabel('Number of clusters (k)')
ylabel('kmeans objective value')
