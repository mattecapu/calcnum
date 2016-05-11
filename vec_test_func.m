function [ z ] = vec_test_func(x)
    z = [
        x(1) - (x(1).^2 + x(2).^2) / 4,
        x(2) - sin(x(1) + 1)
    ];
end
