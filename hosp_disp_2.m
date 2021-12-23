cases = 10*logspace(0,((40-1)/2)*log10(2), 40);
cases_0 = [cases(1:20),zeros(1,20)];
cases_1 = [zeros(1,20),cases(21),zeros(1,19)];
cases_2 = [zeros(1,21),cases(22:end)];
norm = 0.5*norm_dist(1:20,10,2);
hospitalisations_0 = conv(cases_0, norm);
hospitalisations_1 = conv(cases_1, norm);
hospitalisations_2 = conv(cases_2, norm);
hosp = [hospitalisations_0;hospitalisations_1;hospitalisations_2]';
hold off
b=bar(hosp(21:32,:), 'stacked');
b(1).FaceColor=[1,0,1];
b(2).FaceColor=[0,0,1];
b(3).FaceColor=[1,0,1];
legend("Due to cases on other days","Due to cases on day 0");
xlabel("Day")
ylabel("Hospitalisations")
title("Hospitalisations per day when cases double every two days")