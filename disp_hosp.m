n = 500;
day0 = hosp_day(n,10,2,0.5);
day_minus = hosp_day(round(n/sqrt(2)),10,2,0.5);
day_plus = hosp_day(round(n*sqrt(2)),10,2,0.5);

N = 25;
hospitalisations_0 = zeros(1,N);

for j = 1:length(day0)
    if (day0(j) ~= -1 && day0(j) <= N)
        hospitalisations_0(day0(j)) =  hospitalisations_0(day0(j))+1;
    end
end

hospitalisations_minus = zeros(1,N);

for j = 1:length(day_minus)
    if (day_minus(j) ~= -1 && day_minus(j)-1 <= N && day_minus(j)-1 >0)
        hospitalisations_minus(day_minus(j)-1) =  hospitalisations_minus(day_minus(j)-1)+1;
    end
end

hospitalisations_plus = zeros(1,N);

for j = 1:length(day_plus)
    if (day_plus(j) ~= -1 && day_plus(j)+1 <= N && day_plus(j)+1 >0)
        hospitalisations_plus(day_plus(j)+1) =  hospitalisations_plus(day_plus(j)+1)+1;
    end
end

hold off
bar([hospitalisations_minus;hospitalisations_0;hospitalisations_plus]', 'stacked');
title("Hospitalisations due to cases at day minus one, zero and plus one following two-day doubling")
xlabel("Days since day zero");
ylabel("Hospitalisations");
legend("Due to day -1","Due to day 0","Due to day +1");