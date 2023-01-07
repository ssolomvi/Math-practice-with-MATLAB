clear, clc;

A = [3 2 -1; 1 -5 2; -1 -1 2.3];
b = [4; -3; 3.9];
eps = 0.0001;
kmax = 100;
n=length(b);
fprintf('\nMatrix A of coefficients\n');
for i = 1:n
    fprintf('%6.2f',A(i,:));
    fprintf('\n');
end
fprintf('\nVector b of free odds\n');
fprintf('%6.2f \n', b);
%% first approximation
x = zeros(n, 1);
for k = 1:kmax
    z = zeros(n, 1);
    for i = 1:n 
        s(i) = b(i);
        for j = 1:n
            if(i ~= j)
                s(i) = s(i) - A(i,j) * x(j);
            end
        end
        s(i) = s(i) / A(i,i);
        z(i) = z(i) + abs(x(i) - s(i));
        x(i) = s(i);
    end
    if(max(z) < eps)
        break;
    end
end
fprintf('\n Answer computed with Seidel method:\n');
fprintf('%6.2f \n', x);
fprintf('\nCount of iterations k = %3d \n', k); 