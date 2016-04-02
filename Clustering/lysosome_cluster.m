%Loading data
load('move_S10_centroid_100_1_1000ite');


for k = 1:20
      
    %Clustering with 'k' number of clusters
    [C,a,obj] = kmeans_cluster(CTD,k,'random',10);
    size(CTD)
    objective(k) = obj;
    
    
end

k = 1:20;

%plot k-means Objective and corresponding cluster size
plot(k, objective)
xlabel('Number of clusters (k)')
ylabel('kmeans objective value')

%% 
%Loading data
load('move_S10_centroid_100_1_1000ite');

%k-means cluster (4 clusters)
[C,a,obj] = kmeans_cluster(CTD,4,'random',10);
size(CTD)

%Displaying all clusters
display_cluster(CTD,a,C,4)