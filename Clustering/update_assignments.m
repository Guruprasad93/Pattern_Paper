function a = update_assignments(X, C, a)
  
    %Number of clusters
    k = size(C,1);
    
    %Number of dataPoints
    n = size(X,1);
    
    %Initializing Distance Matrix (distMat)
    distMat = zeros(k,n);
    
    %Calculate all distances from each data-point to all cluster centers
    for i = 1:k
        for j = 1:n
            %distMat(i,j) = euclidDist(C(i,:),X(j,:));
            distMat(i,j) = sum((C(i,:)-X(j,:)).^2);
        end
    end
    
    %For each datapoint, find closest center
    [m, Index] = min(distMat,[],1);
    
    %New Cluster Assignments (based on closest center)
    a = Index';

end
