function out = calc_halftone_dither(f,T)
[n,~] = size(T);
[r,c] = size(f);
% Alter dimensions to make the dimensions perfectly divisible by the size
% of the threshold matrix
out_r = change_dim(r,n);
out_c = change_dim(c,n);
%% Padding by reflection
f_temp = zeros([out_r,out_c]);
f_temp(1:r,1:c) = f;
f_temp(r+1:end,1:c) = f(end:-1:2*r-out_r+1,:);
f_temp(1:r,c+1:end) = f(:,end:-1:2*c-out_c+1);
f_temp(r+1:end,c+1:end) = f(end:-1:2*r-out_r+1,end:-1:2*c-out_c+1);
%% Applying threshold matrix on the image
out_temp = zeros([out_r,out_c]);
for i=1:n:out_r
    for j=1:n:out_c
        out_temp(i:i+n-1,j:j+n-1) = 255*double(f_temp(i:i+n-1,j:j+n-1)>=T);
    end
end
out = out_temp(1:r,1:c); %Crop w.r.t input image size
end