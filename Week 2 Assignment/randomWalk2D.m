%%Random Walk Simulation in two dimension
close all; clear;
x = [0];
y = [0];
N = 1000;
figure(1);
hold on;
grid on;
scatter(x,y,'red','o');
for i = 2:N
    random_number = rand();
    if random_number > 0.75
        x(i) = x(i-1) + 1;
        y(i) = y(i-1);
    elseif random_number > 0.5
        x(i) = x(i-1) - 1;
        y(i) = y(i-1);
    elseif random_number > 0.25
        x(i) = x(i-1);
        y(i) = y(i-1) + 1;
    else
        x(i) = x(i-1);
        y(i) = y(i-1) - 1;
    end
    figure(1);
    hold on;
    plot(x,y);
end