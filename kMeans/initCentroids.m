%Initialize centroids randomly taking as centers K points from X
function centroids = initCentroids(X, K)
    centroids = zeros(K,size(X,2)); 
    randidx = randperm(size(X,1));
    centroids = X(randidx(1:K), :);
end