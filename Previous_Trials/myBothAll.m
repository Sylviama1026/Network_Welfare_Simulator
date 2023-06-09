function [F] = myBothAll(k, l, I, L, x, y, c, r)
    F(1) = 0.5*exp(-I*k)/(0.5*exp(-I*k)+0.5)*(x+y-L/(r+L)*y*(1-exp((r+L)*k)/exp((r+L)*l)))-c;
    
    syms t s;
    f_B_sym = symfun(piecewise(t < k, (I-L)*t, t >=k , (I-L)*k-log(1-int((L-1)*exp(-(L-1)*s)*(1-exp(-(I-L)*(t-max(s,k)))),s,0,min(t,l)))), [t]);
    F(2) = 0.5*exp(-f_B_sym(l)-l)/(0.5*exp(-f_B_sym(l)-l)+0.5)*(x + r*y*int(exp(-t+l-f_B_sym(t)+f_B_sym(l)),t,l,inf) )-c;
end