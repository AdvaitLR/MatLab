clc;
clear;

A = [1 0 0 1/4 -8 -1 9; 0 1 0 1/2 -12 -1/6 3; 0 0 1 0 0 1 0];
b = [0; 0; 1];
c = [0 0 0 -3/4 20 -1/2 6];
c = -c;

Bi = [1 2 3];
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
    ratio(col <= 0) = 10^10000;
    
    [l_end, l_ind] = min(ratio);
    
    Bi(l_ind) = minI;
    Cb = c(Bi);
    
    B = A(:, Bi);
end

opt = Cb * -sol;
disp(opt);
