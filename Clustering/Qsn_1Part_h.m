%Loading data
load('kmeans_data')

%Number of runs
N = 1000;

obj_rand = 0;
obj_kmeans = 0;

for i = 1:N
    [C,a,obj_random] = kmeans_cluster(X,9,'random',1);
    obj_rand = obj_rand + obj_random;
    [C,a,obj_kmeansNew] = kmeans_cluster(X,9,'kmeans++',1);
    obj_kmeans = obj_kmeans + obj_kmeansNew;
end

obj_rand = obj_rand/N;
obj_kmeans = obj_kmeans/N;
    
    