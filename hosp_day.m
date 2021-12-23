function days = hosp_day(N, mu, sd, ihr)
    distribution = ihr*norm_dist(1:(2*mu),mu,sd);
    cumulative = zeros(1,2*mu);
    for i = 1:(2*mu)
        cumulative(i) = sum(distribution(1,1:i));
    end
    p = rand(1,N);
    days = 1:N;
    for i = days
        for j = 1:length(cumulative)
            if (p(i) < cumulative(j))
                days(i) = j;
                break
            end
        end
        if (p(i) > ihr)
            days(i) = -1;
        end
    end

end