%
% Controlla la definita positività di una matrice
%
% INPUT
%   A:
%       Matrice
%
% OUTPUT
%   res:
%       Booleano
%

function [ res ] = defpos(A)
    % iteriamo sui minori principali
    for i = 1 : size(A)
        % se l'i-esimo minore principale
        % ha determinante non negativo
        K = A(1 : i, 1 : i);
        if is_singular(K) || det(K) < -eps
            % la matrice non è definita
            res = false;
            return;
        end
    end
    % se tutti i minori principali hanno
    % passato il controllo, la matrice
    % è definita positiva
    res = true;
end
