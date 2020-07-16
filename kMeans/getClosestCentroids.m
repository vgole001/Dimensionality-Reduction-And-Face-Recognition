function indices = getClosestCentroids(X, centroids)
  K = size(centroids, 1);
  indices = zeros(size(X,1), 1);
  m = size(X,1);

  for i=1:m
    k = 1;
    %Assign each data on centroids based on Euclidean distance
    min_dist = sqrt(sum((X(i,:) - centroids(1,:)).^2));
    %Assign each data on centroids based on cosine distance
    %min_dist = 1 - dot(X(i,:),centroids(1,:))/norm(X(i,:))/norm(centroids(1,:));
    for j=2:K
        dist = sqrt(sum((X(i,:) - centroids(j,:)).^2));
        %dist = 1 - dot(X(i,:),centroids(j,:))/norm(X(i,:))/norm(centroids(1,:));
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    indices(i) = k;
  end
end