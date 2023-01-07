clear, clc;

%% build a graphic of system of non-linear equations
first = ezplot('x^2+y^2-4');
set(first,'Color','g','LineWidth',2);
hold on;
second = ezplot('y-exp(x*y)');
set(second,'Color','b','LineWidth',2);
grid on;

ptr1 = [0.5 1];
%% Find root with simple iterations method
ans_iter1 = iter_non_linear(ptr1, 0.0001, @equat_iter);
fprintf(' Found answer with simple iterations: %.6f\t%.6f\n Count of iterations: %d\n\n', ans_iter1(1), ans_iter1(2), ans_iter1(3));
%% Find root with Newton method
disp('Finding a root with Newton method:')
newton(ptr1(1), ptr1(2))
%% Checking if right
[xr, fr, ex] = fsolve(@for_fsolve, ptr1, optimset('TolX',1.0e-2));
plot(xr(1), xr(2), '*r');
fprintf('Found answer with MATLAB built-in functions: %15.9f %15.9f\n', xr(1), xr(2));