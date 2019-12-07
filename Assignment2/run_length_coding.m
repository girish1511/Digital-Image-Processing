function rlc_out = run_length_coding(im,img_type)
[r,c] = size(im);
if strcmp(img_type,'grayscale')
    rlc = rastor_code(im);
    rlc_out = rlc;
else
    m=max(max(im));
    min_bit = ceil(log2(m));
    %bit plane slicing
    bit_planes = zeros(r,c,min_bit);

    for i = 1:r
        for j = 1:c
            bit_planes(i,j,:) = to_bits(im(i,j),min_bit); 
        end
    end
    rlc_bin = cell(min_bit,1);
    if strcmp(img_type,'binary')
        for k=1:min_bit
            rlc_bin{k} = rastor_code(bit_planes(:,:,k));
        end
        rlc_out = rlc_bin;
    else
        %graycode plane slicing
        graycode = zeros(r,c,min_bit);
        graycode(:,:,1) = bit_planes(:,:,1);
        %converting binary planes to graycode planes
        for i=1:r
            for j=1:c
                for k=2:min_bit
                    graycode(i,j,k)=xor(bit_planes(i,j,k),bit_planes(i,j,k-1));
                end
            end
        end
        rlc_gray = cell(min_bit,1);
        for k=1:min_bit
            rlc_gray{k} = rastor_code(graycode(:,:,k));
        end
        rlc_out = rlc_gray;
    end
end
end