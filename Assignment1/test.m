clc;
clear all;
load('input.mat');
[m,n] = size(I);
%% Finding 4-paths
path_type = 4;
path_info = find_paths(I,x1,y1,x2,y2,V,path_type);
%% Finding m-paths
path_type = 10;
path_info = find_paths(I,x1,y1,x2,y2,V,path_type);