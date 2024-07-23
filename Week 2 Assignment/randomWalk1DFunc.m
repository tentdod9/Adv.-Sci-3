function randomWalk1DFunc(N,n,isPlotx,isPlotHist,isPlotx_2)
    x_n = zeros(1,N);
    avg_x_2 = zeros(1,n);
    if isPlotx 
        f1 = figure("Name", sprintf("X_Graph N = %d, n = %d", N, n));
    end
    if isPlotHist
        f2 = figure("Name", sprintf("Histogram N = %d, n = %d", N, n));
    end
    if isPlotx_2
        f3 = figure("Name", sprintf("X^2_Graph N = %d, n = %d", N, n));
    end
    for i = 1:N
        position = [0];
        for j = 2:n
            if rand() > 0.5
                position(j) = position(j-1) + 1;
            else
                position(j) = position(j-1) - 1;
            end
            avg_x_2(j) = avg_x_2(j) + position(j)^2/N;
        end
        if isPlotx
            figure(f1);
            x_n(i) = position(length(position));
            hold on;
            plot(1:n,position);
            title(sprintf("N = %d, n = %d, <x> = %s", i, n, num2str(sum(x_n)/i)));
            xlabel("number of steps (n)");
            ylabel("position (x)");
        end
    end
    if isPlotHist
        figure(f2);
        hist(x_n);
        title(sprintf("%d steps of random walk", n));
        xlabel("position");
        ylabel("number of particle");
    end
    if isPlotx_2
        figure(f3);
        plot(0:n-1,avg_x_2);
        title(sprintf("N = %d, n = %d, <x> = %s", N, n, num2str(avg_x_2(length(avg_x_2)))));
    end
    
end