clear, clc;
% Simple Iterations and Newton's method

eps = 0.00001;
x = -pi/2: pi/20: pi/2;
y1 = atan(x.^2+1./x);
y2 = x;

plot(x', [y1' y2']);

% roots are in intervals (-0.8; -0.7)  (1.1;1.2)
% let phi'(x) = (2*x.^3-1)/(x.^6+2*x.^3+x.^2+1) for phi = atan(x.^2+1./x)
% for the interval (1.1;1.2) the convergence condition of the simple 
% iterations method is met, but for the interval it's not (-0.8; -0.7)

equation = @(x) atan(x.^2+1./x);
x0 = 1.15;
x1 = equation(x0);
while(abs(x1-x0) > eps)
    x0 = x1;
    x1 = equation(x0);
end
fprintf('Answer found using Simple Iterations method:\n\t%.6f\n\n', x1);

clear;
equation = @(x) atan(x.^2 + 1/x) - x;
derivative = @(x) (2 * x.^3 - 1) / (x.^6 + 2 * x.^3 + x.^2 + 1) - 1;

x0 = -0.75;
x1 = x0 - equation(x0) / derivative(x0);
while (abs(x1 - x0) > eps)
    x0 = x1;
    x1 = x0 - equation(x0) / derivative(x0);
end
fprintf("First root found using Newton's method:\n\t%.6f\n\n", x1);

x0 = 1.5;
x1 = x0 - equation(x0) / derivative(x0);
while (abs(x1 - x0) > eps)
    x0 = x1;
    x1 = x0 - equation(x0) / derivative(x0);
end
fprintf("Second root found using Newton's method:\n\t%.6f\n\n", x1);
