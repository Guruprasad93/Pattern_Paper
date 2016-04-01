load('move_S10_100_1_1000ite.mat');
CC = bwconncomp(S10);
SC = false(size(S10));
for i = 1:CC.NumObjects
    SC(CC.PixelIdxList{i}) = true;
end

%save('move_S10connected_100_1_1000ite.mat')
ctd = regionprops(SC,'centroid'); % find centroids
CTD = cat(1,ctd.Centroid); % get (x,y) positions

figure, imshow(SC);

figure, imshow(SC);
hold on
plot(CTD(:,1),CTD(:,2),'c*');
hold off;

