chr_nu = 0.5;
chr_chi = 0.5;

sd_nu = 2;
sd_chi = 2;

mu_nu = 10;
mu_chi = 10;

double_time_nu = 2;
double_time_chi = 4;

N=42;

cases_nu = round(10*logspace(0,((N-1)/double_time_nu)*log10(2), N));
cases_chi = round(10*logspace(0,((N-1)/double_time_chi)*log10(2), N));

hold off
semilogy(1:N, cases_nu);
hold on
semilogy(1:N, cases_chi);
title("Case growth of two variants")
legend("2-day doubling variant", "4-day doubling variant")
xlabel("Days since ten cases")
ylabel("Number of cases");

hospitalisations_nu = zeros(1,N);
hospitalisations_chi = zeros(1,N);

for i = 1:length(cases_nu)
    hospitalisation_days = hosp_day(cases_nu(i), mu_nu, sd_nu, chr_nu);
    for j = 1:length(hospitalisation_days)
       if (hospitalisation_days(j) ~= -1 && hospitalisation_days(j)+i <= N)
          hospitalisations_nu(hospitalisation_days(j)+i) =  hospitalisations_nu(hospitalisation_days(j)+i)+1;    
       end
    end
end
for i = 1:length(cases_chi)
    hospitalisation_days = hosp_day(cases_chi(i), mu_chi, sd_chi, chr_chi);
    for j = 1:length(hospitalisation_days)
       if (hospitalisation_days(j) ~= -1 && hospitalisation_days(j)+i <= N)
          hospitalisations_chi(hospitalisation_days(j)+i) =  hospitalisations_chi(hospitalisation_days(j)+i)+1;    
       end
    end
end

apparent_ihr_nu = hospitalisations_nu((mu_nu+1):end)./cases_nu(1:N-mu_nu);
apparent_ihr_chi = hospitalisations_chi((mu_chi+1):end)./cases_chi(1:N-mu_chi);
% hold off
% plot(apparent_ihr_nu)
% hold on
% plot(apparent_ihr_chi)
% title("Apparent CHR for two variants with idential CHR")
% legend("2-day doubling variant", "4-day doubling variant")
% xlabel("Days since first hospitalisation")
% ylabel("Apparent case hospitalisation rate");