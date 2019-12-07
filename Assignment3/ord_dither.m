function g = ord_dither(f)
% f = double(imread('campus.png'));
[m,n] = size(f);
g = zeros([m,n,3]);
%% Index Matrices
I2 = index_mat(0);
I4 = index_mat(I2);
I8 = index_mat(I4);
%% Threshold matrix
T2 = thres_mat(I2);
T4 = thres_mat(I4);
T8 = thres_mat(I8);
%% Calculating half tone
g(:,:,1) = calc_halftone_dither(f,T2);
g(:,:,2) = calc_halftone_dither(f,T4);
g(:,:,3) = calc_halftone_dither(f,T8);
%% Displaying the images
% fig1 = figure;
% imshow(g3);
% truesize(fig1);
% fig2 = figure;
% imshow(g4);
% truesize(fig2);
% fig3 = figure;
% imshow(g5);
% truesize(fig3);
end