clc;
clear;

M = 10000;

A = [5 1 -1 0 0 M 0 0; 6 4 0 -1 0 0 M 0; 1 4 0 0 -1 0 0 M];
b = [10; 30; 8];
c = [12 10 0 0 0 M M M];
c = -c;

Bi = [5 6];
B = A(:, Bi);
Cb = c(Bi);

while true
    body = B \ A;
    sol = B \ b;
    
    Z = Cb * body - c;
    
    [minV, minI] = min(Z);
    
    if minV >= 0
        break;
    end
    
    col = body(:, minI);
    ratio = sol ./ col;
    ratio(col <= 0) = M;
    ratio(Bi == minI) = M;
    
    [~, l_ind] = min(ratio);
    
    Bi(l_ind) = minI;
    Cb = c(Bi);
    
    B = A(:, Bi);
end

opt = Cb * -sol;
disp(opt);