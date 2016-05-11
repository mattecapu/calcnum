%
% Risolve un sistema triangolare superiore
%
% INPUT
%   A:
%       Matrice incompleta del sistema, dev'essere triangolare superiore
%   b:
%       Colonna dei termini noti
%
% OUTPUT
%   x:
%       Soluzione del sistema
%

function [ x ] = triang_sis(A, b)

    % dimensione di A
    n = size(A, 1);

    x = zeros(n, 1);

    x(n) = b(n) ./ A(n, n);

    for i = (n - 1) : -1 : 1
        j = (i + 1) : n;
            x(i) = (b(i) - A(i, j) * x(j)) ./ diag(A(i, i));
    end

end
