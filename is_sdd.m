%
% Controlla se una matrice è diagonale dominante per righe
%
% INPUT
%   A:
%       Matrice da controllare
%
% OUTPUT
%   res:
%       true se è d.d. per righe, false altrimenti
%

function [ res ] = is_sdd(A)
    for i = 1:size(A)
        % se trovo un elemento che non è dominante
        % per la sua riga
        if abs(A(i, i)) <= ( sum(A(i, :)) - A(i, i) )
            % la matrice non è d.d. per righe
            res = false;
            return;
        end
    end
    % se tutti gli elementi sono dominanti,
    % la matrice è d.d. per righe
    res = true;
end
