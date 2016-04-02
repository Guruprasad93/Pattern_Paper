function [C, a] = lloyd_iteration(X, C)
  
    %Number of Clusters
    k = size(C,1);
    
    %Number of Data points
    N = size(X,1);   

    %Random assignment of clusters
    a = randi(k,N,1);
    
    while(1)
        a1 = update_assignments(X,C,a);
        
        %Checking if there is a change in assignment
        if a1 == a
            
            break;
        else
        
            C = update_centers(X,C,a1);
            a = a1;
        end
        
    end
    
    C = update_centers(X,C,a1);
    a = a1;
end
        
         
