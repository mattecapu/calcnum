%
% Risolve un sistema lineare usando il metodo di eliminazione di gauss
%
% INPUT
%   A:
%       Matrice incompleta del sistema
%   b:
%       Vettore colonna dei termini noti
%
% OUTPUT
%   x:
%       Soluzione del sistema
%

function [ x ] = gauss(A, b)
    [C, d] = gauss_triang(A, b);
    x = triang_sis(C, d);
end
