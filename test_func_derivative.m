%
% Derivata della funzione test
%

function [ y ] = test_func_derivative(x)
    y = x.^4 - 4 * x.^3 + 3 * x.^2 + 2 * x;
end
