%Set the M term accordingly for dimension reduction 
M = 0.25;

% Load images into matrix w
w = load_images();

% Initializations
% train_set contains images with even column number
% test_set contains images with odd column number
train_set = w(1:end, 2:2:end);
test_set = w(1:end, 1:2:end);

% Randomly pick an index in range 1 and 200 from test set
ri = round(200*rand(1,1));            
r = test_set(:,ri); 
                          
O = uint8(ones(1,size(train_set,2)));
% Calculate the mean value for each row in train set
m = uint8(mean(train_set,2));
% Normalize train set by subtracting the mean from each row
vzm = train_set - uint8(single(m) * single(O));

% Calculate eigenvectors of the covariance matrix S
S = single(vzm)' * single(vzm);
[V,D] = eig(S);
V = single(vzm) * V;

N = 200*M;    

% Pick the eignevectors corresponding to M largest eigenvalues
V = V(:,end:-1:end-(N-1));

% Calculate the reduced features for each image
cv = zeros(size(train_set,2),N);
for i = 1:size(train_set,2);
    % Each row in cv is the feature for one image
    cv(i,:) = single(vzm(:,i))' * V;    
end

% Recognition 
% Now, we run the algorithm and see if we can correctly recognize the face. 
subplot(121); 
imshow(reshape(r,112,92));title('Looking for...');
subplot(122);
% Normalize the test image
p = r-m;
% Multiply it by the basis vector
s = single(p)'*V;

z=[];
for i = 1:size(train_set,2)
    % Use the square norm as our loss function
    z = [z,norm(cv(i,:)-s,2)];
    % Draw the image which has the lowest loss 
    if(rem(i,20) == 0),imshow(reshape(train_set(:,i),112,92)),end;
    drawnow;
end
[a,i] = min(z);

subplot(122);
imshow(reshape(train_set(:,i),112,92));title('Image found...');

figure;
plot(w(:,1),w(:,2),'.');
title('Original Data');

figure;
plot(V(:,1),V(:,2),'.');
title('Reduced Data');



