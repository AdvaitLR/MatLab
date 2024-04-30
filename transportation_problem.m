clear 
clc

% feasible solution

c = [2 10 4 5; 6 12 8 11; 3 9 5 7];

sup = [10 25 20];
dem = [25 10 15 5];

m = 3;
n = 4;

x = zeros(m,n);

while(min(c(:))~=10^5)
    [M,I] = min(c(:));
    [I_row, I_col] = ind2sub(size(c),I);
    
    if sup(I_row)<dem(I_col)
        x(I_row,I_col) = sup(I_row);
        dem(I_col) = dem(I_col)-sup(I_row);
        sup(I_row) = 0;
    else
        x(I_row,I_col) = dem(I_col);
        sup(I_row) = sup(I_row)-dem(I_col);
        dem(I_col) = 0;
    end
    
    c(I_row,I_col)= 10^5;
end
   
disp(x);