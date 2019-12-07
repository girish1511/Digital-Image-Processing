function b = to_bits(x,n)
b = zeros(1,n);
count = 1;
while x>0
    b(n-count+1) = mod(x,2);
    x = floor(x/2);
    count=count+1;
end
end
