%
% Triangolarizza un sistema lineare usando il metodo di Gauss™
%
% INPUT
% 	A:
%		Matrice incompleta del sistema
%		Si richiede sia definita positiva
%	b:
%		Vettore colonna dei termini noti
%
% OUTPUT
%	A:
%		Matrice incompleta di un nuovo sistema
%		equivalente ma triangolare superiore
%	b:
%		Vettore colonna
%

function [ A, b ] = gauss_triang(A, b)

	% il metodo di Gauss naive richiede che
	% tutti i minori principali siano regolari
	if ~defpos(A)
		error('Ogni minore principale di A dev''essere regolare');
	end

	% inizializziamo le variabili di lavoro
	n = size(A);
	l = 0;

	% per ogni riga della matrice
	for k = 1 : (n - 1)
		% per ogni elemento da k in giù
		i = (k + 1) : n;
			% dividiamo ogni elemento al di sotto
			% della diagonale per il k-esimo pivot
			l = A(i, k) / A(k, k);

			% azzeriamo la colonna sotto la diagonale
			A(i, k) = 0;

			% sottraiamo ad ogni riga di A
			% la k-esima moltiplicata per il pivot
			j = (k + 1) : n;
				A(i, j) -= l * A(k, j);

			% facciamo altrettanto per b
			b(i) -= l * b(k);
	end
end
