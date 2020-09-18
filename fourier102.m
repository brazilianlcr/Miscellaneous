function [P] = fourier102(x_min, x_max, N)
%Fourier series plotter for MSE 102 homework. Note the difference in
%indexing from -Inf to Inf, as opposed to positive integers for fourier117.
%   x_min and x_max are lower and upper bounds of domain, respectively.
%   N is half the number of iterations. Centered at 0. 
x = linspace(x_min, x_max); %Defines the domain.
F = zeros(1, length(x)); %Creates the empty array over which we'll add the partial sums.
for n = -N:N %Defines the order of the approximation. 
    if n~=0 
        fn = -(3*exp(-2*i*n*pi)*(-1+exp(2*i*n*pi)-(2*i*n*pi)))/(4*(n^2)*(pi^2));
    else
        fn = 3/2;
    end
    
    F = F + fn.*exp(i*2*pi*n*x/3); %Obtains the Fourier series approximation. 
end

hold off
P = plot(x, F); %Plots the Fourier series. 
