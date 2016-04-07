function [PCN,jj]= ExpClstr(PC,CTD,N,i,j,Eps,MinPts)

% distance with other points;
D = sqrt(sum((CTD - [CTD(i,1)*ones(N,1) CTD(i,2)*ones(N,1)]).^2,2));
[seedsNo] = find(D<=Eps); % point index in CTD including self

if length(seedsNo) < MinPts
    PC(i) = -1; % assign point i to be noise
    jj = j; % no change in cluster ID
else
    jj = j+1; % add a new cluster
    PC(seedsNo) = jj; % assign to a new cluster
    [id] = find(seedsNo==i);
    seedsNo(id) = [];  % delete point i from seeds
    ii = 1;
    while size(seedsNo)>0 
        % EPS-neighborhood
        DS = sqrt( sum( ( CTD-...
            [CTD(seedsNo(ii),1)*ones(N,1),CTD(seedsNo(ii),2)*ones(N,1)]...
            ).^2,2 ) );
        [rsltNo] = find(DS<=Eps); % point index in PC including self
        
        NN = length(rsltNo); % # of points in seed ii EPS-neigb
        if NN >= MinPts
            [pts] = find(PC(rsltNo)<1);
            PC(rsltNo(pts)) = jj;
            seedsNo = [seedsNo; rsltNo(pts)];
        end % end if NNN>=MinPts
         seedsNo(ii)=[]; % delete seed ii
    end % end while
    sprintf('%d',(size(seedsNo,1)))
end % end if
PCN = PC;