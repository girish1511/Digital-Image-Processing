function im = gen_im(rad,inner_sq_len,outer_sq_len,circ_range,inner_sq_range,outer_sq_range)
if 2*rad>outer_sq_len
    sprintf('Diameter of circle exceeds outer boundary length.\nOuter square length changed');
    outer_sq_len = outer_sq_len + 2*(2*rad-outer_sq_len);
end
outer_sq_val = randi(outer_sq_range);
inner_sq_val = randi(inner_sq_range);
circ_val = randi(circ_range);

im = outer_sq_val*ones(outer_sq_len,outer_sq_len);
t1 = (outer_sq_len-inner_sq_len)/2;
t2 = (outer_sq_len+inner_sq_len)/2;
im(t1:t2,t1:t2)=inner_sq_val;
%drawing circle in the image
center = [(outer_sq_len+1)/2, (outer_sq_len+1)/2]; %finds center of image for plotting circle
for i=0:rad
    for j=0:rad
        dist = norm(floor(center+[i,j])-center);
        if dist<=rad
            indices = zeros(2);
            indices(1,:) = floor(center+[i,j]);
            indices(2,:) = ceil(center-[i,j]);
            im(indices(:,1),indices(:,2))=circ_val;
        end
    end
end
end