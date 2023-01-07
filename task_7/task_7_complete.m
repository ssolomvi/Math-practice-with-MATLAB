clear, clc;
syms y(x) ; 
enq = diff(y,x) == (y.^2*log(x) - y) ./ x; 
S = dsolve(enq);

cond = y(1) == 1; 
Sc = dsolve(enq, cond);
fprintf('Answer found with MATLAB built-in function:\n%s\n\n', Sc);

v = symvar(Sc); 
dya = @ (X) double (subs (Sc, v, X));

f = @(x1,y1) (y1.^2*log(x1) - y1) ./ x1;

x = 1:0.1:3;
dya_x = dya(x);
plot(x, dya_x);

y0 = 1; % y(1) = 1

%% Euler method
dye_x = [];
dye_x(1) = y0;
n = length(x);
h = x(2) - x(1);
for i=1:n-1
    dye_x(i+1) = dye_x(i) + h*f(x(i), dye_x(i));
end
plot(x, dya_x, 'r*', x, dye_x, 'k*', x, dya_x, 'b');
legend({'Answer with MATLAB built-in function', 'Answer with Euler method'},'Interpreter','latex','FontSize',10)

%% Runge-Kutt
dyr_x = [];
dyr_x(1) = y0;
n = length(x) ;
h = x(2) - x(1);
for i=1:n-1
    k1 = h*f(x(i),dyr_x(i));
    k2 = h*f(x(i)+h/2,dyr_x(i)+k1/2);
    k3 = h*f(x(i)+h/2,dyr_x(i) +k2/2);
    k4 = h*f(x(i)+h/2,dyr_x(i) +k3);
    dyr_x(i+1) = dyr_x(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end
figure; 
plot(x, dya_x, 'r*',x, dyr_x, 'k*', x, dya_x, 'b');
% legend({'Answer with Runge–Kutta method','Answer with MATLAB built-in function'},'Interpreter','latex','FontSize',10)
legend({'Answer with MATLAB built-in function', 'Answer with Runge-Kutta method'},'Interpreter','latex','FontSize',10)
