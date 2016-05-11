%
% Verifica che la matrice A sia ben condizionata
% (non singolare a meno di approssimazione numerica)
%
% INPUT
%   A:
%       Matrice da testare
%
% OUTPUT
%   res:
%       true se è singolare, false altrimenti
%

function [ res ] = is_singular(A)
    res = rcond(A) < 1e-12;
end
