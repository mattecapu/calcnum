
function [ x, it  ] = bisect(func, a, b, tol, MAX_ITERATIONS = 10^9)
    it = 0;

    x = [];

    fa = feval(func, a);
    fb = feval(func, b);

    if fa*fb >= 0
        error('Il segno di func() dev''essere discorde agli estremi');
    end

    while abs(b - a) >= tol

        x = a + (b - a) / 2;
        fx = feval(func, x);

        % se ho trovato lo zero, esco
        if abs(fx) < tol
            %fprintf('Arresto per f(x) = %e\n', fx);
            return;
        end

        % altrimenti aggiorno uno degli estremi
        if fa*fx < 0
            b = x;
        else
            a = x;
            fa = fx;
        end

        if ++it >= MAX_ITERATIONS
            error('Raggiunto il numero massimo di iterazioni')
        end

    end
end
