function J = dF(X)
    x = X(1); y = X(2);
    J = [2 * x, 2 * y; -y * exp(x * y), 1 - x * exp(x * y)];
end