im = imread('cameraman.tif');
boundary_options = {5,'replicate','symmetric','circular'};
filtering_mode = {'corr','conv'};
w = fspecial('motion',11);
equal_check = zeros(2,4);
for i=1:2
    for j=1:4
        out_mat = imfilter(im,w,filtering_mode{i},boundary_options{j});
        out_me = imfilter_16110057(im,w,filtering_mode{i},boundary_options{j});
        equal_check(i,j) = isequal(out_mat,out_me);% to test whether the outputs of my function and matlab's function pixel-wise equal
    end
end
%%
imshow(im);
title('Input image')
figure;
imshow(out_me,[0,255]);
title('Output of user-defined function')
figure;
imshow(out_mat)
title('Output of in-built function')