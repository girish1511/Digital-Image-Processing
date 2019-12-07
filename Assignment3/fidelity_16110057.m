function a = fidelity_16110057(f,g)
% f = double(imread('campus.png'));
f = double(f);
[m,n] = size(f);
% g = zeros([m,n]);
g = double(g);
a=zeros(1,6);

a(1) = sum(sum(f-g))/(m*n);
a(2) = sum(sum(abs(f-g)))/(m*n);
%%
f11 = pow_gam(f,2.2);
g11 = pow_gam(g,2.2);
f12 = pow_gam(f,1/(2.2));
g12 = pow_gam(g,1/(2.2));

a(3) = sum(sum(abs(f11-g11)))/(m*n);
a(4) = sum(sum(abs(f12-g12)))/(m*n);
%%
gauss = fspecial('gaussian', 7);
f21 = imfilter(f11, gauss);
g21 = imfilter(g11, gauss);
f22 = imfilter(f12, gauss);
g22 = imfilter(g12, gauss);

f31 = pow_gam(f21,1/3);
g31 = pow_gam(g21,1/3);
f32 = pow_gam(f22,1/3);
g32 = pow_gam(g22,1/3);

a(5) = sum(sum(abs(f31-g31)))/(m*n);
a(6) = sum(sum(abs(f32-g32)))/(m*n);
end