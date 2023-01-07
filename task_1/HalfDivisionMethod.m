% Half Division Method 1 task
clc, clear;

x = 0.0 : 0.001 : 2.0;
f= @(x) x.^3 + x - 3;
plot(x, f(x), 'g'), grid on;
hold on

a = 0.0;
b = 2.0;
e = 0.001;
iteration = 0;

while abs(a - b) > e
    c = (a + b) / 2;
    if sign(f(c)) == sign(f(a))
        a = c;
    else
        b = c;
    end
    iteration = iteration + 1;
end
disp(['Answer gotten with Half Division Method: ' num2str(c,8)]);
disp(['Answer found at iteration number: ' num2str(iteration)]);
plot(c, 0, "r*");