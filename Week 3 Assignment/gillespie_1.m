%%Gillespie in degradition of chemical reaction A
close all; clear;
n = 10000; %number of step
N = 100; %number of run (walker)
A_0 = 20;
k = 0.1; %unit is [s^-1]
dt = 0.005; % unit is [s]
result = zeros(1,n);
f1 = figure();
for i = 1:N
    iterator_value = A_0;
    current_result = zeros(1,n);
    for j = 1:n
        if rand() < k*dt*iterator_value
            iterator_value = iterator_value - 1;
        end
        current_result(j) = current_result(j) + iterator_value;
    end
    result = result + current_result./N;
    figure(f1);
    hold on;
    plot((1:n).*dt, current_result,HandleVisibility='off');
end
plot((1:n).*dt, result,"--k",LineWidth=2);
xlabel("Time (sec)");
ylabel("Number of Molecules A");

gillespieStepN = A_0;
time_array = zeros(1,gillespieStepN);
A_array = zeros(1,gillespieStepN);
A_array(1) = A_0;
for i = 1:gillespieStepN
    tau = (1/(A_array(i)*k)) * log(1/rand());
    time_array(i+1) = time_array(i) + tau;
    if A_array(i) - 1 >= 0;
        A_array(i+1) = A_array(i) - 1; 
    end
end
plot(time_array, A_array,"--r",LineWidth=2);
legend("Mean (SSA)", "Gillespie");