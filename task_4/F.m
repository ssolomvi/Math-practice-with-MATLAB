function Y = F(X)
    x = X(1); y = X(2);
    Y = [x.^2 + y.^2 - 4 ; y - exp(x * y)];
end
