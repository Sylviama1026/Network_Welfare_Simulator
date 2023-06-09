function m = myEquationAll(k, l, I, L, x, y, c, r)
    syms t s;
    f_B_sym = symfun(piecewise(t < k, (I-L)*t, t >=k , (I-L)*k-log(1-int((L-1)*exp(-(L-1)*s)*(1-exp(-(I-L)*(t-max(s,k)))),s,0,min(t,l)))), [t]);
    m = 0.5*exp(-f_B_sym(l)-l)/(0.5*exp(-f_B_sym(l)-l)+0.5)*(x + r*y*int(exp(-t+l-f_B_sym(t)+f_B_sym(l)),t,l,inf) )-c;
end