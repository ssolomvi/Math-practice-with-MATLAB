clear, clc;
funct = @(x) (sqrt(x)./ (1 + x.^2));
upp_limit = 1;
low_limit = 0;
step = 0.00001;

%% Precise answer
integ_answ = integral(funct, 0, 1);
fprintf('Answer found with MATLAB integral:    %.6f\n\n', integ_answ);

%% Rectangular method
count_of_iters = ((upp_limit - low_limit) / step) + 1;
i = 1:count_of_iters;
x = low_limit:step:upp_limit;
y = feval(funct, x);
m = 2:count_of_iters;
y1(m - 1) = y(m);
rectan_answ = sum(step * y1);
fprintf('Answer found with Rectangular method: %.6f\n', rectan_answ);
fprintf('Deviation from MATLAB one: %.6f\n\n', abs(integ_answ - rectan_answ));

%% Trapezoids method
trapz_input = funct(x);
trapez_answ = trapz(x, trapz_input);
fprintf('Answer found with Trapezoids method:  %.6f\n', trapez_answ);
fprintf('Deviation from MATLAB one: %.6f\n\n', abs(integ_answ - trapez_answ));

%% Simpson method
step = 10000;
count_of_iters = (upp_limit - low_limit) / step;
simps_answ = funct(low_limit);
for i = 1:1:((step / 2) - 1)
    x = low_limit + 2 * count_of_iters * i;
    simps_answ = simps_answ + 2 * funct(x) + 4 * funct(x + count_of_iters);
end
simps_answ = count_of_iters * simps_answ / 3;
fprintf('Answer found with Simpson method:     %.6f\n', simps_answ);
fprintf('Deviation from MATLAB one: %.6f\n\n', abs(integ_answ - simps_answ));

syms f(x)
f(x) = sqrt(x)./ (1 + x.^2);
f_int = int(f(x),x);
fplot([f,f_int], [-0.5, 1.5])
legend({'$f(x) = sqrt(x)/ (1 + x^2)$','$\int f(x)dx$'},'Interpreter','latex','FontSize',13)
hold on;

