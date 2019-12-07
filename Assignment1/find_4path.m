function [path_info, path_no]=find_4path(x,y,x2,y2,bin_im,path_mem,path_info,path_no,path)
[m,n] = size(bin_im);
if is_pxl(x,y,m,n)
    if (bin_im(x,y))&&(path_mem(x,y))%checks pixel value and its history
        path_mem(x,y) = 0;
        Nx = [x+1,x-1,x,x];
        Ny = [y,y,y-1,y+1];
        for i=1:4
            try
                path_info(path_no).length = path_info(path_no).length+1;
            catch
                path_info(path_no).length = length(path)+1;
                path_info(path_no).path = path;%assigning previous path
            end
            %adding current pixel to path
            path_info(path_no).path{path_info(path_no).length} = [x,y];
            if (x==x2)&&(y==y2)
                return
            end
            %moving on to the neighbouring pixels
            [path_info,path_no] = find_4path(Nx(i),Ny(i),x2,y2,bin_im,path_mem,path_info,path_no,path_info(path_no).path);
            path_no = path_no+1;
        end
    else
        %if pixel is already visited or pixel value is not valid then
        %that path is made invalid by setting its length to -1
        path_info(path_no).length = -1;
        return
    end
else
    %if its an invalid pixel, i.e., coordinates lie outside the image then
    %that path is made invalid by setting its length to -1
    path_info(path_no).length = -1;
    return
end
end