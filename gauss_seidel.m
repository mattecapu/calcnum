%
% Calcola la soluzione di un sistema lineare
% con il metodo di Gauss-Seidel™
%
% INPUT
%   A:
%       Matrice incompleta del sistema.
%       Per avere convergenza dev'essere dominante per righe
%   b:
%       Vettore colonna dei termini noti
%   [tol = eps]:
%       Errore tollerato sull'approssimazione
%   [MAX_ITERATIONS = 10^5]:
%       Numero massimo di iterazioni
%
% OUTPUT
%   x:
%       Soluzione approssimata del sistema
%   converged:
%       Booleano che indica se il metodo ha converso
%

function [ x, converged ] = gauss_seidel(A, b, x_init, tol = eps, MAX_ITERATIONS = 10^5)

    % verifichiamo tol sia sensato
    if tol <= eps
        tol = eps;
        disp('`tol` è più piccolo della precisione di macchina, riassegnato a eps');
    end

    if ~is_sdd(A)
        error('Il metodo non converge se la matrice A non è d.d. per righe');
    end

    % Genera una matrice con la diagonale di A
    D = diag(diag(A));

    % opposta della triangolare inferiore di A,
    % ma senza la diagonale (shift in basso di 1)
    L = -tril(A, -1);

    % opposta della triangolare superiore di A,
    % ma senza la diagonale (shift in alto di 1)
    U = -triu(A, +1);

    % matrice di Gauss-Seidel
    B = triang_inv(D - L);

    % moltiplichiamo una volta per tutte la matrice B
    % per U e b, visto che rimangono costanti per tutte
    % le iterazioni
    transf_U = B * U;
    transf_b = B * b;

    % variabili che memorizzano
    % le iterazioni del programma che ci interessano
    % (le ultime 2, per calcolare la condizione di arresto)
    x = x_init;
    x_prev = x_init .^ 2;

    it = 0;
    converged = true;

    while true

        % aggiorniamo le approssimazioni
        x_prev = x;
        x = transf_U * x_prev + transf_b;

        % controlliamo la condizione di arresto
        if norm(x - x_prev) / min(norm(x), norm(x_prev)) <= tol
            break;
        end

        if ++it >= MAX_ITERATIONS
            disp('Numero massimo di iterazioni raggiunto');
            converged = false;
            break;
        end
    end

end
