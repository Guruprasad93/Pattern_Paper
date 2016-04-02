function obj = kmeans_obj(X, C, a)
  
    %Number of clusters 
    k = size(C,1);
    
    %Number of Data points
    N = size(X,1); 
    
    obj = 0;
    
    for i = 1:N
        obj = obj + sum((X(i,:)-C(a(i),:)).^2);
    end
    
end
