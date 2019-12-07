function image = random_rectangles(M,N,border,n,w1,w2,alpha,max_iterations,Vf,Vb)
    image = rand(M+2*border,N+2*border); % random initialization of the image
    image = uint8(image);                %conversion to uint8 type matrix
    
    for i = 1:M+2*border                 %assigning black border to the respective pixels
        for j = [1:border N+border+1:N+2*border]
            image(i,j) = 0;              
        end    
    end

    for j = border+1:N+border
        for i = [1:border M+border+1:M+2*border]
            image(i,j) = 0; 
        end 
    end

    width = w1:w2;                               %random width matrix 
    rand_widths = [];                            %storage matrix of random widths   
    
    for i = 1:n                                  %random widths storage process
        rand_w = fix(1+length(width)*rand(1));
        rand_widths(i) = width(rand_w);    
    end
    rand_heights = alpha*rand_widths;            %random heights based on alpha and random widths

    for i = border+1:M+border                    %assigning pixel values to the background(except border)
        for j = border+1:N+border
            if nargin <= 8                       % if Vf and Vb are not provided as inputs
                image(i,j) = 255;
            end
            if nargin > 8                        % if Vf and Vb are provided 
                background_random = fix(1+length(Vb)*rand(1));
                image(i,j) = Vb(background_random); % assigning random values to the background from Vb
            end
        end
    end

    rect_cell = {};                     % cell creation for storing all the rectangles
    
    for i = 1:length(rand_widths)       %storage process of the random rectangles generated
        rand_orientation = fix(1+2*rand(1));
        if nargin <= 8             
            if rand_orientation==1      % first orientation implies rows:width columns:height
                rect_cell{i} = rand(rand_widths(i),rand_heights(i));
                rect_cell{i}(:,:) = 0;
            end
            if  rand_orientation==2     % first orientation implies rows:height columns:width
                rect_cell{i} = rand(rand_heights(i),rand_widths(i));
                rect_cell{i}(:,:) = 0;
            end
        end
        
        if nargin > 8                   % if Vf and Vb are provided 
            foreground_random = fix(1+length(Vf)*rand(1));
            if rand_orientation==1
                rect_cell{i} = rand(rand_widths(i),rand_heights(i));
                rect_cell{i}(:,:) = Vf(foreground_random);
            end
            if  rand_orientation==2
                rect_cell{i} = rand(rand_heights(i),rand_widths(i));
                rect_cell{i}(:,:) = Vf(foreground_random);
            end
        end
    end

    for i = 1:n                                                      %assigning the rectangles 
        iter=1;
        while iter <= max_iterations
            temp_iter = iter;                                        %reference value for iterations 
            [r_i,c_i] = find(image);                                 %non zero values in the image
            point_matrix = [r_i c_i];
            top_left_random = fix(1 + length(point_matrix)*rand(1)); %finding the random corner of the image
            [rows,columns] = size(rect_cell{i});
            bottom_right_v = [point_matrix(top_left_random,1)+rows-1, point_matrix(top_left_random,2)+columns-1]; %calculating the bottom right corner of the rectangle
        
            for r = point_matrix(top_left_random,1)-1 : bottom_right_v(1)+1     % ensuring that there are no values belonging to Vf(or)255 in the rectangular region enclosed by the corners
                for c = point_matrix(top_left_random,2)-1 : bottom_right_v(2)+1 % this is also to ensure that no 2 rectangles are overlapping
                    if nargin <= 8
                        if r>M+2*border || c>N+2*border || image(r,c)==0
                            iter = iter + 1;
                        end
                    end
                    if nargin > 8 
                        if r>M+2*border || c>N+2*border || (Vf(1) <= image(r,c)==1 && Vf(length(Vf)) >= image(r,c) == 1) || image(r,c) == 0
                            iter = iter + 1;
                        end
                    end
                end
            end
            if iter == temp_iter           % if all the conditions are satisfied, there will be no increase in iter value
                image(point_matrix(top_left_random,1):bottom_right_v(1),point_matrix(top_left_random,2):bottom_right_v(2)) = rect_cell{i};
                break                      % exiting the while loop for installing the next rectangle
            end
            if iter > max_iterations                                                        % if iter exceeds maximum iterations 
                M=M+M;                                                                      %increasing the size of image
                N=N+N;
                if nargin > 8 
                    image = random_rectangles(M,N,border,n,w1,w2,alpha,max_iterations,Vf,Vb);% repeating the same function with the updated inputs
                end
                if nargin <=8
                    image = random_rectangles(M,N,border,n,w1,w2,alpha,max_iterations);
                end
            end
        end
    end
    imwrite(image,'output.png'); %saving the output image
    imshow(image)  %displaying the image
end
