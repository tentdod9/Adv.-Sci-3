close all; clear; clf;
N  = 10000;
x_min = -5; x_max = 5;
y_min = 0; y_max = 1;
x_rand = x_min + (x_max - x_min) * rand(1,N);
y_rand = y_min + (y_max - y_min) * rand(1,N);
mu = 0; sigma = 1;
x = linspace(x_min,x_max,N);
function x = distribution (mu, sigma, x)
x = (1/(sigma*sqrt(2*pi)))*exp(-(0.5*((x-mu)/sigma).^2));
end
target = distribution(mu,sigma,x);
hold on;
title(sprintf("Acceptance-Rejection Method on Normal Distribution with mu = %d and variance = %d", mu, sigma));
plot(x,target,'black',LineWidth=2);
scatter(x_rand(y_rand < distribution(mu,sigma,x_rand)),y_rand(y_rand < distribution(mu,sigma,x_rand)),[],'blue',"o");
scatter(x_rand(y_rand > distribution(mu,sigma,x_rand)),y_rand(y_rand > distribution(mu,sigma,x_rand)),[],'red',".");
legend('Normal Distribution','Accept','Reject');
