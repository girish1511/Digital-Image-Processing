im = gen_im(10,30,50,[200,255],[120,130],[0,50]);
imshow(im,[0,255]);
img_type='grayscale';
rlc = run_length_coding(im, img_type);