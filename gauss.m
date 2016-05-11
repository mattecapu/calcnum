function [ x ] = gauss(A, b)
    [C, d] = gauss_triang(A, b);
    x = triang_sis(C, d);
end
