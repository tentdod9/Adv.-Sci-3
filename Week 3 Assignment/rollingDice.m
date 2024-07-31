%%Rolling Dice Simulation
close all; clear;
n = 1000; %number of step
N = 2; %number of dice
result = zeros(1,(N*6-N)+1);
for i = 1:n
    dice_summation = 0;
    for j = 1:N
        dice_rand = rand();
        if dice_rand > (5/6)
            dice_summation = dice_summation + 6;
        elseif dice_rand > (4/6)
            dice_summation = dice_summation + 5;
        elseif dice_rand > (3/6)
            dice_summation = dice_summation + 4;
        elseif dice_rand > (2/6)
            dice_summation = dice_summation + 3;
        elseif dice_rand > (1/6)
            dice_summation = dice_summation + 2;
        else
            dice_summation = dice_summation + 1;
        end
    end
    result(dice_summation-N+1) = result(dice_summation-N+1) + 1;
end
result = result./n;

%h = histogram(N:N*6,result);
%h.BinLimits = [N N*6];
%histogram(result, 'BinEdges', N:1:6*N);

hold on;
bar(N:6*N, result);
plot(N:6*N,result,"-r",LineWidth=2)
if N == 2
    plot(N:6*N,[1,2,3,4,5,6,5,4,3,2,1]./36,"-b",LineWidth=2);
    legend("Histrogram","Simulation","Exact");
else
    legend("Histrogram","Simulation");
end
title(sprintf("Total number of steps = %d", n))