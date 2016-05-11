%
% Risolve un sistema quadrato col metodo di Cramer™
%
% INPUT:
%   A:
%       Matrice incompleta del sistema, dev'essere regolare
%   b:
%       Vettore colonna dei termini noti
% OUTPUT:
%   x:
%       Vettore colonna soluzione del sistema
%

function [ x ] = cramer(A, b)

    if is_singular(A)
        error('A dev''essere regolare');
    end

    x = A \ b;

end
