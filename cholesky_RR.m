%
% Calcola la decomposizione di Cholesky per la matrice A
%
% INPUT
%   A:
%       Matrice da decomporre, si richiede sia simmetrica e definita positiva
%
% OUTPUT
%   R:
%       Risultato della decomposizione, tale che R*R' = A
%

function [ R ] = cholesky_RR(A)
    % dimensione di A
    n = size(A);

    % verifichiamo A sia simmetrica
    % (matrice vera = matrice tutti 1, devo aggiungere In)
    if (A ~= A') + eye(n)
        error('A non è simmetrica');
    end

    % verifichiamo A sia definita positiva
    if ~defpos(A)
        error('A non è definita positiva');
    end

    % inizializziamo la matrice
    R = zeros(n);

    % eseguiamo il primo passo sulla prima riga
    % che fa da condizione iniziale per i passi successivi
    R(1, 1) = sqrt(A(1, 1));
    R(2:end, 1) = A(2:end, 1) / R(1, 1);

    for j = 2 : n
        % pseudo-ciclo su k
        k = 1 : (j - 1);
            R(j, j) = sqrt( A(j, j) - R(j, k) * R(j, k)' );
            R(:, j) = ( A(:, j) - R(:, k) * R(j, k)' ) / R(j, j);
    end
end
