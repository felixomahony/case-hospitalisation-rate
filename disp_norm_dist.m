norm = 0.5*norm_dist(1:20,10,2);
hold off
plot(1:20,norm, 'm');
title("Distribution of hospitalisations after infection, \mu =10, \sigma =2");
xlabel("Days since infection");
ylabel("Probability of hospitalisation");