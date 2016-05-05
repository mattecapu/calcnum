%
% Calcola l'inversa di una matrice triangolare inferiore
%
% INPUT
%   L:
%       Matrice triangolare inferiore invertibile
%
% OUTPUT
%   B:
%       Matrice triangolare inferiore inversa di L
%

function [ B ] = triang_inv(L)

    % verifichiamo la correttezza dell'input
    if L ~= tril(L)
        error('L dev''essere triangolare inferiore');
    end
    if abs(det(L)) <= eps
        error('L dev''essere invertibile');
    end

    % dimensione della matrice
    n = size(L);

    % inizializziamo B alla matrice inversa
    % della diagonale di L
    B = diag( 1 ./ diag(L) );

    for i = 2 : n;
        j = 1 : (i - 1);
            k = j : (i - 1);
                B(i, j) = -( L(i, k) * B(k, j) ) / L(i, i);
    end
end
