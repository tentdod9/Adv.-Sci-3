%%Random Walk Simulation in one dimension
close all; clear;
N  = 1000; %number of walker
n = 100; %number of step
randomWalk1DFunc(N,n,true,true,false);

%%Plot x^2 against n for differents casese
N_list = [100,100,1000]; %number of walker
n_list = [1000,10000,1000]; %number of step
for i = 1:length(N_list)
    randomWalk1DFunc(N_list(i),n_list(i),false,false,true);
end


