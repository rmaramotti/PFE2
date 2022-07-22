clear variables
close all

M = readmatrix('clusterMatrix.txt');
nsubjects = 31;
similarityMatrix = zeros(1,sum(1:17));

i = 1;
for roi1 = 1 : size(M,1) - 1
    for roi2 = roi1 + 1 : size(M,1)
        count = 0;
        for k = 1 : nsubjects
            if M(roi1 ,k) ~= M(roi2 ,k)
                count = count + 1;
            end
        end
        similarityMatrix(i) = count;
        i = i + 1;
    end
end

% Calcolo linkages
linkageMatrix = linkage(similarityMatrix, 'average');

% Costruzione dendrogramma
figure, dendrogram(linkageMatrix), title('Dendrogramma post analisi gruppo');

% Calcolo dissimilarity
dissimilarity = cophenet(linkageMatrix, similarityMatrix);

% Costruzione clusters
clusterMatrix = cluster(linkageMatrix, 'cutoff', 1/sqrt(2)+1e-12);