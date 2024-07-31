%%Gillespie in degraditio and production n of chemical reaction A and B
close all; clear;
n = 500; %number of step
N = 10; %number of run (walker)
A_0 = 0; % A(0) = A_0
B_0 = 0; % B(0) = B_0
k1 = 0.001; %unit is [s^-1]
k2 = 0.01; %unit is [s^-1]
k3 = 1.2; %unit is [s^-1]
k4 = 1; %unit is [s^-1]
result = zeros(1,n);
f1 = figure();
figure(f1);
xlabel("Time (sec)");
ylabel("Number of Molecules A");

f2 = figure();
figure(f2);
xlabel("Time (sec)");
ylabel("Number of Molecules B");

meanA = zeros(1,n+1);
meanB = zeros(1,n+1);
maxTime = 0;
for i = 1:N
    currentA_result = zeros(1,n);
    currentA_result(1) = A_0;
    currentB_result = zeros(1,n);
    currentB_result(1) = B_0;
    time_array = zeros(1,n);
    for j = 1:n
       if j == 1
           alpha1 = currentA_result(j).^2.*k1;
       else
           alpha1 = currentA_result(j).*currentA_result(j-1).*k1;
       end 
       
       alpha2 = currentA_result(j)*currentB_result(j)*k2;
       alpha3 = k3; alpha4 = k4;
       alpha0 = alpha1 + alpha2 + alpha3 + alpha4;
       tau = (1/alpha0)*log(1/rand());
       time_array(j+1) = time_array(j) + tau;
       random_number_r2 = rand();
       if random_number_r2 < alpha1/alpha0
           currentA_result(j+1) = currentA_result(j) - 2;
           currentB_result(j+1) = currentB_result(j);
       elseif random_number_r2 < (alpha1+alpha2)/alpha0
           currentA_result(j+1) = currentA_result(j) - 1;
           currentB_result(j+1) = currentB_result(j) - 1;
       elseif random_number_r2 < (alpha1+alpha2+alpha3)/alpha0
           currentA_result(j+1) = currentA_result(j) + 1;
           currentB_result(j+1) = currentB_result(j);
       else
           currentA_result(j+1) = currentA_result(j);
           currentB_result(j+1) = currentB_result(j) + 1;
       end
       %Substance A and B cannot be minus
       currentA_result(j) = max(currentA_result(j),0);
       currentB_result(j) = max(currentB_result(j),0);
    end

    if i == 1
        HandleVisibilityStatus = 'on';
    else
        HandleVisibilityStatus = 'off';
    end
    figure(f1);
    hold on;
    plot(time_array, currentA_result,Color="#b0aaa9",HandleVisibility=HandleVisibilityStatus);
    figure(f2);
    hold on;
    plot(time_array, currentB_result,Color="#b0aaa9",HandleVisibility=HandleVisibilityStatus);
    meanA = meanA + currentA_result./N;
    meanB = meanB + currentB_result./N;
    maxTime = max(maxTime,time_array(length(time_array)));
end
average_time_array = linspace(0,maxTime,n+1);
figure(f1);
plot(average_time_array,meanA,"-r",LineWidth=2);
legend("A","mean")
figure(f2);
plot(average_time_array,meanB,"-b",LineWidth=2);
legend("B","mean")