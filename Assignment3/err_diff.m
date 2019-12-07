function g = err_diff(f)
t = 127;
% Padding
f_temp = zeros(size(f)+[2,2]);
f_temp(2:end-1,2:end-1) = f;
g_temp = zeros(size(f_temp));
diff_filt = [0,0,0;0,0,7/16;3/16,5/16,7/16]; %to progagate the error to future pixels.
%% Applying diffusion filter
% Procedure followed is similar to that of conv and corr
[r,c] = size(f_temp);
for i=2:r-1
    for j=2:c-1
        g_temp(i,j) = 255*double(f_temp(i,j)>=t);
        err = f_temp(i,j)-g_temp(i,j);
        f_temp(i-1:i+1,j-1:j+1) = f_temp(i-1:i+1,j-1:j+1) + err*diff_filt;
    end
end
%%
g = g_temp(2:r-1,2:c-1);
% fig = figure;
% imshow(g);
% truesize(fig);
end