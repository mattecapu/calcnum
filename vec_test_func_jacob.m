function [ J ] = vec_test_func_jacob(x)
    J = [
        1 - x(1)/2,        -x(2)/2;
        -cos(x(1) + 1),    1
    ];
end
