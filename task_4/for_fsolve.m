function f = for_fsolve( x )
    f(1) = x(1).^2 + x(2).^2 - 4;
    f(2) = x(2) - exp(x(1) * x(2));
end