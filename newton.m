%
% Trova uno zero di func vicino ad x0 con il metodo di Newton™
%
% INPUT
%   func:
%       Funzione di cui trovare uno zero
%	jacob:
%		Jacobiana della funzione precedente
%   x:
%       Approssimazione iniziale dello zero
%   [tol = eps]:
%       Tolleranza sull'approssimazione
%   [MAX_ITERATIONS = 10^5]:
%       Numero massimo di iterazioni
%
% OUTPUT
%   x:
%       Approssimazione dello zero
%   it:
%       Numero di iterazioni eseguito dal programma
%   converged:
%       false se MAX_ITERATIONS non è stato raggiunto e il programma
%       si è arrestato perchè la condizione di arresto è stata raggiunta
%

function [ x, it, converged ] = newton(func, jacob, x, tol = eps, MAX_ITERATIONS = 10^5)

	% verifichiamo tol sia sensato
	if tol < eps
		tol = eps;
		disp('`tol` è più piccolo della precisione di macchina, riassegnato a eps');
	end

    it = 0;
    converged = true;

    while true
        % calcoliamo i valori della funzione
        % e della jacobiana in x
		func_x = feval(func, x);
    	jacob_x = feval(jacob, x);

		if is_singular(jacob_x)
			error('Lo zero è di molteplicità > 1');
		end

        % x_new è x(i+1) - x(i)
		x_new = jacob_x \ -func_x;

		% aggiorniamo l'approssimazione
		x += x_new;

		% per cui x(i+1) - x(i) = x_new
		if norm(x_new, Inf) <= tol
			break;
		end

        if ++it >= MAX_ITERATIONS
            disp('Numero massimo di iterazioni raggiunto');
            converged = false;
            break;
        end
    end
end
