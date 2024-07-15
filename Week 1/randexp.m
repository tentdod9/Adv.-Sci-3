function x = randexp (N,lamp)
u = rand(1,N);
x = -1/lamp*log(1-u);
figure(1), clf;
hist(x,100);
title(['Sample mean = ', num2str(mean(x))]);
end