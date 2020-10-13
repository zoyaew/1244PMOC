function img_result = min_filter(img_input, size)
    M = length(img_input(:,1));
    N = length(img_input(1,:));
    m = ceil((size-1)/2);
    n = size-m-1;
    img_result = zeros(M, N);
    
    % fill img_result by loop through all elements
    for i=1:M
        for j=1:N
            top = ((i-m-1)>=0)*(i-m-1)+1; %max(i-m,1)
            bottom = ((i+n-M)<=0)*(i+n-M)+M; %min(i+n,M)
            left = ((j-m-1)>=0)*(j-m-1)+1; %max(j-m,1)
            right = ((j+n-N)<=0)*(j+n-N)+N; %min(j+n, N)
            local_min = inf;
            % Get the minimum in the local (size x size) img_input
            for u=top:bottom
                for v=left:right
                    if(img_input(u,v) < local_min)
                        local_min = img_input(u,v);
                    end
                end
            end
            % Assign the local minimum to the img_result
            img_result(i,j) = local_min;
        end
    end
    
    img_result = uint8(img_result);
end