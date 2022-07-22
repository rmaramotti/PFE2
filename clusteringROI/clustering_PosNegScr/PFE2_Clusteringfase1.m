clear variables
close all

load('../betas.mat');

nsubjects = 31;
dissimilarity = zeros(31, 1);
clusterMatrix = zeros(18, 31);

for subj = 1 : nsubjects
    betasMatrix = betasTensor(:,:,subj);
    betasMatrix = normalize(betasMatrix);
    
    % Clustering agglomerativo
    clusterMatrix(:,subj) = clusterdata(betasMatrix','Linkage','average','Cutoff', 1);
end

writematrix(clusterMatrix, 'clusterMatrix.txt');