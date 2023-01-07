function res = equat_iter(in)
    res(1) = log(abs(in(2))) / in(2);
    res(2) = sqrt(abs(4 - (in(1))^2));
end