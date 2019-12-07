function final_path_info = find_paths(I,x1,y1,x2,y2,V,path_type)

%% Initialization
[m,n] = size(I);
path_info=struct('path',{{}},'length',0);%initialized to stored the raw information of paths
path_mem = ones(m,n);%matrix to store whether a pixel has been visited before or not
%% Binarize Image I w.r.t V
bin_im = zeros(m,n);
for i=1:m
    for j=1:n
        for v = V
            if I(i,j) == v
                bin_im(i,j) = 1;
                break
            end
        end
    end
end
%%
if path_type == 4
    [path_info, ~]=find_4path(x1,y1,x2,y2,bin_im,path_mem,path_info,1,{});
elseif path_type==8
    [path_info, ~]=find_8path(x1,y1,x2,y2,bin_im,path_mem,path_info,1,{});
elseif path_type==10
    [path_info, ~]=find_mpath(x1,y1,x2,y2,bin_im,path_mem,path_info,1,{});
else
    %if path_type gets a value other than 4,8 or 10
    sprintf("Enter valid path_type:\n4 => 4-path\n8 => 8-path\n10 => m-path");
   return
end
%% Filtering out valid paths
final_path_info=struct('path',{{}},'length',0,'shortest_path',0);
min_len = m*n;
min_ind = 0;
count = 1;
for i=1:length(path_info)
    if path_info(i).length ~= -1
        final_path_info(count).path = path_info(i).path;
        final_path_info(count).length = path_info(i).length;
        final_path_info(count).shortest_path = 0;
        if min_len>path_info(i).length
            final_path_info(count).shortest_path = 1;
            try
                final_path_info(min_ind).shortest_path = 0;
                min_len=path_info(i).length;
                min_ind = count;
            catch
                min_len=path_info(i).length;
                min_ind = count;
            end
        end
        count = count+1;
    else
        continue
    end
end
end