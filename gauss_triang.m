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
			% coeff. con cui moltiplicare la i-esima riga
			% (tale che A(i, k) si azzeri)
			l = A(i, k) / A(k, k);

			% sottraiamo alla i-esima riga
			% la k-esima moltiplicata per il coeff. l
			j = k : n;
				A(i, j) -= l * A(k, j);

			% facciamo altrettanto per b
			b(i) -= l * b(k);
	end
end
