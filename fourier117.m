function [p] = fourier117(t,N)
%Fourier series plotter for E117 Homework 1
yp = 0;
y = zeros(1, 100);
x = linspace(0, 1);
for n = [1:1:N]
    yn = [];
    for i = x
        yp = (8/((pi*n)^2))*(sin(n*pi/2)*cos(n*pi*t)*sin(n*pi*i));
        yn = [yn yp];
    end
    y = y+yn;
end
p = plot(x, y)