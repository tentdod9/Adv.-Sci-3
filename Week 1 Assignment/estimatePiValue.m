close all; clear; clf;
N  = 10000000;
x = rand(1,N);
y = rand(1,N);
pointsInCircle = sum((x.^2+y.^2 <= 1));
piValue = 4*(pointsInCircle/N);
fprintf("pi value is %d", piValue);
hold on;
title(sprintf("pi value = %d w/ sample of %d", piValue, N));
scatter(x((x.^2+y.^2 <= 1)),y((x.^2+y.^2 <= 1)),[],'red',".");
scatter(x((x.^2+y.^2 > 1)),y((x.^2+y.^2 > 1)),[],'blue',".");