%We run kMeans on the reduced data taken from PCA so in order 
%to run kMeans run pca.m first

%K is the num of centroids
K = 10;
max_iterations = 10;
centroids = initCentroids(V, K);

for i=1:max_iterations
  indices = getClosestCentroids(V, centroids);
  centroids = computeCentroids(V, indices, K);
end

plot(V(:,1), V(:,2), '.');
hold on
plot(centroids(:,1), centroids(:,2), 'rx');
title('kMeans on Reduced Data');


