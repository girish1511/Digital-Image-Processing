function dim = change_dim(x,n)
if mod(x,n)
    dim = x+n-mod(x,n);
else
    dim = x;
end
end