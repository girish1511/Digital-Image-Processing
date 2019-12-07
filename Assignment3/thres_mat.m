function out = thres_mat(I)
% Implementation of the equatio given in the assignment pdf
[n,~]=size(I);
out = (255/(n^2))*(I+0.5);
end