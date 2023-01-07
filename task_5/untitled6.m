clear, clc;
%% least square method

% node coordinates
x = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
y = [10.2, 10.37, 10.5, 10.6, 10.76, 10.8, 10.9, 11, 11.1, 11.2];
N = length(x); % nodes count

ex1  = sum(x);
ex2 = sum(x.^2);
ex3 = sum(x.^3);
ex4 = sum(x.^4);

ey  = sum(y);
exy = sum(x.*y);
exy2 = sum(y.*x.^2);

A = [ex4 ex3 ex2; ex3  ex2 ex1; ex2 ex1 N];
B = [exy2;exy;ey];
aa=A\B;

% coefficients
ax = aa(1);
bx = aa(2);
cx = aa(3);

disp(ax); disp(bx); disp(cx); % display coeffs

% calculate the resulting line
x2 = linspace(min(x),max(x),200);
y2 = ax.*x2.^2 + bx.*x2 + cx;

figure
hold on
plot(x, y, '*B') 
plot(x2, y2, 'R'), grid on;
legend('Original function','Least square method');

%% Lagrange polynomial 
x0 = 0.2;
y0 = lagrange(x,y,x0);

syms X
for i = 1:length(x)
    u = x;
    u(i)=[]; % puncture the i-th element
    P(i,1) = prod(X-u)/prod(x(i)-u); % calculate i-th Lagrange polynomial
end
Y = y*P; % sum of products of y and i-th elements
 
pretty(collect(Y,X))

% calculate Lagrange points for plotting
xx = linspace(min(x), max(x), 200);
yy = lagrange(x, y, xx);

figure
plot(x,y,'or',xx,yy,':r',x0,y0,'*b'), grid on
legend('Data','Lagrange Interpolation','Dot', 'location', 'northwest')

%% Newton polynomial
% calculate Newton points to build a graph
xx = linspace(min(x),max(x),200);
yy = newton(x,y, xx);

figure
plot(x,y,'or',xx,yy,':r'), grid on
legend('Data','Newton interpolation', 'location', 'northwest')