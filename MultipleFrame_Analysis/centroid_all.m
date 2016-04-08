%Load dataset
load('move_S_BW_100_1_1000ite')

%% Find centroid Matrix for each frame

%Number of frames
num_frames = size(S,3); 

for frame = 1:num_frames
    
    CC = bwconncomp(S(:,:,frame));
    SC = false(size(S(:,:,frame)));
    for i = 1:CC.NumObjects
        SC(CC.PixelIdxList{i}) = true;
    end

    %save('move_S10connected_100_1_1000ite.mat')
    ctd = regionprops(SC,'centroid'); % find centroids
    CTD = cat(1,ctd.Centroid); % get (x,y) positions

    %% Run DBSCAN Clustering Algorithm

    epsilon=43;
    MinPts=4;
    IDX=DBSCAN(CTD,epsilon,MinPts);
    
    %% Plot Results

    PlotClusterinResult(CTD, IDX);
    title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
    filename = sprintf('dbscan_images\\frame%0.3d',frame);
    saveas(gcf, filename, 'jpg')
    close all
end