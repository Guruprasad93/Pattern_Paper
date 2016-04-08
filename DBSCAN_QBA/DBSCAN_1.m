clc; close all; clear all;
%load('centroid.mat')
load('move_S10_centroid_100_1_1000ite.mat')
N = size(CTD,1); % # of points
PC = zeros(N,1); % which points in which cluster
Eps = 45;
MinPts = 4;
j = 0; % number of clusters
for i = 1:N
    if PC(i) == 0; % unclassified point
        [PCN,jj] = ExpClstr(PC,CTD,N,i,j,Eps,MinPts); % expand cluster
    end
    PC = PCN;
    j = jj;
    
end

%plotting the nth cluster & noise
[cl1id] = find(PC==1);
CL1 = CTD(cl1id,:);
[cl2id] = find(PC==2);
CL2 = CTD(cl2id,:);
[noiseid] = find(PC==-1);
Noise = CTD(noiseid,:);
figure, plot(CL1(:,1),CL1(:,2),'o',CL2(:,1),CL2(:,2),'ob')
hold on; 
plot(Noise(:,1),Noise(:,2),'or')
%axis([0 402 0 366]) % 'centroid.mat'
axis([0 1044 0 966])
