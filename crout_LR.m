%
% Decompone la matrice A in due matrici triangolari
% L (superiore) ed R (inferiore) usando il metodo di Crout™
%
% INPUT
%	A:
%		Matrice da decomporre
%
% OUTPUT
%	L, R:
%		Matrici triangolari tali che L*R = A
%

function [ L, R ] = crout_LR(A)

	% dimensione di A
	n = size(A);

	% verifichiamo che A sia definita positiva
	if ~defpos(A)
		error('A non è definita positiva');
	end

	% inizializziamo le matrici
	L = eye(n);
	R = zeros(n);

	for i = 1 : n
		% pseudo-cicli su j e k
		j = 1 : (i - 1);
			k = i : n;
				R(i, k) = A(i, k) - L(i, j) * R(j, k);
      		k = k(2:end)
				L(k, i) = (A(k, i) - L(k, j) * R(j, i)) / R(i, i);
	end
end
