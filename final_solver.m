function [tau] = final_solver(k, l, I, L, x, y, c, r, p0)
    %solver for tau_k
    tau(1) = p0*exp(-I*k)/(p0*exp(-I*k)+(1-p0))*(x+y-L/(r+L)*y*(1-exp((r+L)*k)/exp((r+L)*l)))-c;
    
    %solver for tau_l
    syms t s;
    f_B_sym = symfun(piecewise(t < k, (I-L)*t, t >=k , (I-L)*k-log(1-int((L-1)*exp(-(L-1)*s)*(1-exp(-(I-L)*(t-max(s,k)))),s,0,min(t,l)))), [t]);
    tau(2) = p0*exp(-f_B_sym(l)-l)/(p0*exp(-f_B_sym(l)-l)+(1-p0))*(x + r*y*int(exp(-t+l-f_B_sym(t)+f_B_sym(l)),t,l,inf) )-c;
end