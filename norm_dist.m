function p = norm_dist(x, mu, sd)

p = 1/(sd*sqrt(2*pi))*exp(-0.5*((x-mu)/sd).^2);

end