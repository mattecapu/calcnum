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

    if abs(det(A)) <= eps
        error('A dev''essere regolare');
    end

    x = A \ b;

end
