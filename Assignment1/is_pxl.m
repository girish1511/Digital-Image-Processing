function res = is_pxl(x,y,m,n)
%check whether a pixel is valid or not
if ((x>=1)&&(y>=1)&&(x<=m)&&(y<=n))
    res=1;
else
    res=0;
end
end