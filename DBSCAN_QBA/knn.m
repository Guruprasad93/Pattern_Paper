% KNN
load('move_S10_centroid_100_1_1000ite.mat')
for i = 1: size(CTD)
    [IDX(i,:),KNND(i,:)] = knnsearch(CTD,CTD(i,:),'k',5);  
end

figure, plot(1:size(CTD,1),sort(KNND(:,end),'descend'),'o')