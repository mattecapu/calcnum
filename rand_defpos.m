%
% Genera una matrice definita positiva casuale
%
% INPUT
%   n:
%    Dimensione della matrice da generare
%
% OUTPUT
%   A:
%       Matrice definita positiva di dimensioni n×n
%

function [ A ] = rand_defpos(n)
    A = zeros(n);
    while ~defpos(A)
        % matrice casuale
        R = rand(n);
        % definita positiva + rumore positivo
        A = R * R' + abs(randn(n));
    end
end
