function [L_n P] = lagrange(x,y,xx)
% x - массив координат узлов
% y - массив значений интерполируемой функции
% xx - массив значений точек интерполяции
L_n = zeros(size(xx));
for k=1:length(x)
    P = ones(size(xx));
    for i=1:length(x)
        if k~=i
            P = P.*(xx-x(i))./(x(k)-x(i));
        end
    end
    P0(k,:) = P;
    L_n = L_n + y(k)*P;
end
end