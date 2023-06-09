function [F] = myBoth(k, l)
    F(1) = 0.5*exp(-1000*k)/(0.5*exp(-1000*k)+0.5)*(3-990/991*(1-exp(991*k)/exp(991*l)))-1;
    
    syms t s;
    f_B_sym = symfun(piecewise(t < k, 10*t, t >=k , 10*k-log(1-int(989*exp(-989*s)*(1-exp(-10*(t-max(s,k)))),s,0,min(t,l)))), [t]);
    F(2) = 0.5*exp(-f_B_sym(l)-l)/(0.5*exp(-f_B_sym(l)-l)+0.5)*(2 + int(exp(-t+l-f_B_sym(t)+f_B_sym(l)),t,l,inf) )-1;
end