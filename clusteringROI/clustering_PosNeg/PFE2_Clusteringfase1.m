clear variables
close all

load('../betas.mat');
betasTensor = betasTensor(1:4,:,:);

nsubjects = 31;
dissimilarity = zeros(31, 1);
clusterMatrix = zeros(18, 31);

for subj = 1 : nsubjects
    betasMatrix = betasTensor(:,:,subj);
    betasMatrix = normalize(betasMatrix);
    
    clusterMatrix(:,subj) = clusterdata(betasMatrix','Linkage','complete','Cutoff', 1.1);
end

writematrix(clusterMatrix, 'clusterMatrix.txt');