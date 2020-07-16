%Load images
function out = load_images()
persistent w;
    v = zeros(10304,400);
    %Iterate through each folder
    for i = 1:40
        cd(strcat('s',num2str(i)));
        for j = 1:10
            a = imread(strcat(num2str(j),'.pgm'));
            %Reshape v such that each column contains one image
            v(:,(i-1)*10+j) = reshape(a,size(a,1)*size(a,2),1);
        end
        cd ..
    end
    % Use uint8 to for memory efficiency
    w = uint8(v);
out = w;



