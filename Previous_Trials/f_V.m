function V=f_V(l, k, I, L, x, c, r)
    B_l = f_B(l, k, l, I, L);
    V = (0.5*x-c)/r + exp(-r*l)*(0.5*exp(-B_l-l)*(x-c)-0.5*c*(r-1)/r);
end