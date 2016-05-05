%
% Trova uno zero di func in [x0, x1] con il metodo di bisezione
%
%
function [ x, it, converged ] = bisect(func, x0, x1, tol = eps, MAX_ITERATIONS = 10^5)

    func_x0 = feval(func, x0);
    func_x1 = feval(func, x1);

    if func_x0 * func_x1 >= 0
        error('Il segno di func() dev''essere discorde agli estremi');
    end

    % stima conservativa sul valore di func(x)
    func_x = Inf;

    it = 0;
    converged = true;

    while abs(x1 - x0) > tol

        % x è il p.to medio di x0x1
        x = x0 + (x1 - x0) / 2;

        % valutiamo func(x)
        func_x = feval(func, x);

        % se ho trovato lo zero, esco
        if abs(func_x) < eps
            break;
        end

        % altrimenti aggiorno uno degli estremi
        if func_x0 * func_x < eps
            x1 = x;
        else
            x0 = x;
            func_x0 = func_x;
        end

        if ++it >= MAX_ITERATIONS
            disp('Numero massimo di iterazioni raggiunto');
            converged = false;
            break;
        end
    end
end
