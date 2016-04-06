%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPML110
% Project Title: Implementation of DBSCAN Clustering in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

clc;
clear;
close all;

%% Load Data

%data=load('mydata');
%X = data.X;
data = load('move_S10_centroid_100_1_1000ite');
X=data.CTD;

%% Estimate Eps and MinPts parameters
x = X(:,1);
y = X(:,2);
[n,d]=knnsearch(x,y,'k',4);
kdist = d(:,4);

plot(sort(kdist,'descend'))



%% Run DBSCAN Clustering Algorithm

epsilon=43;
MinPts=4;
IDX=DBSCAN(X,epsilon,MinPts);


%% Plot Results

PlotClusterinResult(X, IDX);
title(['DBSCAN Clustering (\epsilon = ' num2str(epsilon) ', MinPts = ' num2str(MinPts) ')']);
