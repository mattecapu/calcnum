%
% Funzione per testare i metodi di ricerca degli zeri
% Ha uno zero circa in 0.89
%

function [ y ] = test_func(x)
    y = 1/5 * x.^5 - x.^4 + x.^3 + x.^2 - 1;
end
