function rlc = rastor_code(im)
[r,c] = size(im);
temp = im.';
prev = temp(1);
prev_ind = 1;
rlc = "";
count = 1;
for i=2:r*c
    if (temp(i)~=prev)
        rlc=rlc+"("+int2str(prev)+","+int2str(i-prev_ind)+") ";
        count = count+1;
        prev = temp(i);
        prev_ind = i;
    end
    if i==r*c
        rlc=rlc+"("+int2str(prev)+","+int2str(i-prev_ind+1)+")";
    end
end
end