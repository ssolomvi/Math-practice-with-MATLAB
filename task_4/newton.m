function newton(x, y)
    tol = 1e-6;
    diff = tol + 1;
    n = 0;
    nmax = 1000;
    disp('  n     x(n)            y(n)            |f(x)|');
    X = [x; y];
    Y = F(X);
    while diff >= tol && n <= nmax
        changeX = -dF(X)\Y;
        X = X + changeX;
        Y = F(X);
        diff = norm(changeX);
        n = n + 1;
        fprintf('%3d %15.9f %15.9f %10.5g \n', n, X(1), X(2), norm(Y));
    end
    if n > nmax
        disp('Failed to converge');
    else
        fprintf('Root found with Newton method: %15.9f %15.9f\n', X(1), X(2));
    end
end