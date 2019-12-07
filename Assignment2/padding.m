function p_im = padding(f,pad_r,pad_c,boundary_options)
[r,c] = size(f);
p_im = ones(r+2*pad_r, c+2*pad_c);
if isa(boundary_options,'double')||(isa(boundary_options,'double'))
    p_im = boundary_options*p_im;
    p_im(1+pad_r:end-pad_r, 1+pad_c:end-pad_c) = f;
else
    p_im(1+pad_r:end-pad_r, 1+pad_c:end-pad_c) = f;
    %padding by replicating
    if strcmp(boundary_options,'replicate')
        p_im(1:pad_r,1:pad_c) = f(1,1);
        p_im(1:pad_r,end-pad_c+1:end) = f(1,end);
        p_im(end-pad_r+1:end,1:pad_c) = f(end,1);
        p_im(end-pad_r+1:end,end-pad_c+1:end) = f(end,end);
        for i=1+pad_r:r+pad_r
            p_im(i,1:pad_c) = p_im(i,pad_c+1);
            p_im(i,end-pad_c+1:end) = p_im(i,end-pad_c);
        end
        for j=1+pad_c:c+pad_c
            p_im(1:pad_r,j) = p_im(1+pad_r,j);
            p_im(end-pad_r+1:end,j) = p_im(end-pad_r,j);
        end
     
    %symmetric padding
        
    elseif strcmp(boundary_options,'symmetric')
        p_im(1:pad_r,1:pad_c) = f(pad_r:-1:1,pad_c:-1:1);
        p_im(1:pad_r,end-pad_c+1:end) = f(pad_r:-1:1,end:-1:end-pad_c+1);
        p_im(end-pad_r+1:end,1:pad_c) = f(end:-1:end-pad_r+1,pad_c:-1:1);
        p_im(end-pad_r+1:end,end-pad_c+1:end) = f(end:-1:end-pad_r+1,end:-1:end-pad_c+1);
        
        p_im(1+pad_r:r+pad_r,1:pad_c) = f(:,pad_c:-1:1);
        p_im(1+pad_r:r+pad_r,end-pad_c+1:end) = f(:,end:-1:end-pad_c+1);
        p_im(1:pad_r,1+pad_c:c+pad_c) = f(pad_r:-1:1,:);
        p_im(end-pad_r+1:end,1+pad_c:c+pad_c) = f(end:-1:end-pad_r+1,:);
        
    %circular padding    
    elseif strcmp(boundary_options,'circular')
        p_im(1:pad_r,1:pad_c) = f(end-pad_r+1:end,end-pad_c+1:end);
        p_im(1:pad_r,end-pad_c+1:end) = f(end-pad_r+1:end,1:pad_c);
        p_im(end-pad_r+1:end,1:pad_c) = f(1:pad_r,end-pad_c+1:end);
        p_im(end-pad_r+1:end,end-pad_c+1:end) = f(1:pad_r,1:pad_c);
        
        p_im(1+pad_r:r+pad_r,1:pad_c) = f(:,end-pad_c+1:end);
        p_im(1+pad_r:r+pad_r,end-pad_c+1:end) = f(:,1:pad_c);
        p_im(1:pad_r,1+pad_c:c+pad_c) = f(end-pad_r+1:end,:);
        p_im(end-pad_r+1:end,1+pad_c:c+pad_c) = f(1:pad_r,:);
    else
        sprintf('Invalid boundary option!!')
        return
    end
end
end