%
% Trova uno zero di func in [x0, x1] con il metodo delle secanti
%
% INPUT
%   func:
%       Funzione di cui trovare uno zero
%   x0, x1:
%       Estremi dell'intervallo di ricerca
%   tol:
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

function [ x, it, converged ] = secants(func, x0, x1, tol, MAX_ITERATIONS = 10^5)

    % x(i + 1)
    x_new = 0;

    % valori di func in x(i) e x(i - 1)
    func_x1 = feval(func, x0);
    func_x0 = 0;

    it = 0;
    converged = true;

    while abs(x1 - x0) > tol
        % calcolo i valori della funzione
        % in x(i) e x(i - 1)
        func_x0 = func_x1;
        func_x1 = feval(func, x1);

        % calcolo la nuova approssimazione
        x_new = x1 - ((func_x1 * (x1 - x0)) / (func_x1 - func_x0));

        % aggiorno x(i), x(i - 1)
        x0 = x1;
        x1 = x_new;

        if ++it >= MAX_ITERATIONS
            disp('Numero massimo di iterazioni raggiunto');
            converged = false;
            break;
        end
    end

    % ritorna il risultato
    x = x1;

end
