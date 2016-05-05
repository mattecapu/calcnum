%
% Trova uno zero di func vicino ad x0 con il metodo di Newton-Raphson™
%
% INPUT
%   func:
%       Funzione di cui trovare uno zero
%	func_deriv:
%		Derivata della funzione precedente
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

function [ x, it, converged ] = newton(func, func_deriv, x, tol = eps, MAX_ITERATIONS = 10^5)

	% verifichiamo tol sia sensato
	if tol <= eps
		tol = eps;
		disp('`tol` è più piccolo della precisione di macchina, riassegnato a eps');
	end

	% stima conservativa sul valore della funzione
	% nel punto iniziale
	func_x = Inf;

    it = 0;
    converged = true;

    while abs(func_x) > tol
        % calcolo i valori della funzione
        % e della derivata
    	func_deriv_x = feval(func_deriv, x);
        func_x = feval(func, x);

        % aggiorno l'approssimazione
        x -= (func_x / func_deriv_x);

        if ++it >= MAX_ITERATIONS
            disp('Numero massimo di iterazioni raggiunto');
            converged = false;
            break;
        end
    end
end
