%Update our new centroids
function centroids = computeCentroids(X, idx, K)
    [m n] = size(X);
    centroids = zeros(K, n);
    for i=1:K
        xi = X(idx==i,:);
        ck = size(xi,1);
    centroids(i, :) = (1/ck) * sum(xi);
    %centroids(i, :) = (1/ck) * [sum(xi(:,1)) sum(xi(:,2))];
    end
end