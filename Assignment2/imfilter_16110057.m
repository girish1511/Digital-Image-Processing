% f = gen_im(10,30,50,[200,255],[120,130],[0,50]);
function g = imfilter_16110057(f,w,filtering_mode,boundary_options,size_options)
if nargin==2
    filtering_mode = 'corr';
    size_options = 'same';
    boundary_options =0;    
end
if nargin==3
        size_options = 'same';
        boundary_options =0;
end
if nargin==4
    size_options = 'same';
end
[r,c] = size(f);
[fr,fc] = size(w);
if ~(mod(fr,2)&&mod(fc,2))
    sprintf('Height and width of filter mask must be odd');
    return
else
    %padding of image
    pad_r = (fr-1)/2;
    pad_c = (fc-1)/2;
    if ~((r>pad_r)&&(c>pad_c))
        sprintf('Size of filter mask too big!');
    else
        p_im = padding(f,pad_r,pad_c,boundary_options);
    end
    g = p_im;
    %convolution and correlation
    if strcmp(filtering_mode,'conv')
        w = w(end:-1:1,end:-1:1);
    end
    for i=1+pad_r:r+pad_r
        for j=1+pad_c:c+pad_c
            g(i,j) = round(sum(sum(w.*p_im(i-pad_r:i+pad_r,j-pad_c:j+pad_c))));
        end
    end
    if strcmp(size_options,'same')
        g = g(1+pad_r:end-pad_r,1+pad_c:end-pad_c);
    end
end
end