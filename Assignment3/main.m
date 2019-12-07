%% Reading Image
clc;
clear all;
% f = double(imread('campus.png'));
f = double(imread('Photo2.png'));
% f = double(imread('Photo2.png'));
[r,c] = size(f);
g = zeros([r,c,6]);
%% Thresholding
g(:,:,1) = 255*double(f>=127);
%% Random Noise Binarization
f1 = f + randi([-128 128], r, c);
g(:,:,2) = 255*double(f1 >= 127);
%% Halftone algorithms
g(:,:,3:5)= ord_dither(f);%Ordered Dithering
g(:,:,6) = err_diff(f);%Error diffusion
%% Fidelity of all images
fid = cell(1,6);
for i=1:6
    fid{i}=fidelity_16110057(f,g(:,:,i));
end
%% Results
fprintf('Fidelity\nvalues:\t\tg1\tg2\tg3\tg4\tg5\tg6\n')
for i=1:6
    fprintf("\t"+num2str(char(945))+""+num2str(i)+"\t")
    for j=1:6
        fprintf("%0.2f \t",fid{j}(i));
    end
    fprintf("\n");
end
%% Save output images in TIFF format
% for i=1:6
%     filename = char("campus/g"+num2str(i)+".jpg");
%     imwrite(g(:,:,i),filename);
% end