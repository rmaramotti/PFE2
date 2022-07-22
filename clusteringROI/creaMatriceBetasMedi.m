clear variables
close all

load('betas.mat');
nsubjects = 31;
betasMedi= zeros(6,18);

for i = 1 : 6
    for j = 1 : 18
        betasMedi(i,j) = mean(betasTensor(i,j,:));
    end
end

save('betas.mat', 'betasMedi', '-append');
writematrix(betasMedi, 'PFE2_betasMedi.txt');

