function eqn_B=f_B(t, k, l, I, L)
if t<k
    eqn_B=(I-L)*t;
else
    syms s;
    eqn_B = (I-L)*k-log(1-int((L-1)*exp(-(L-1)*s)*(1-exp(-(I-L)*(t-max(s,k)))),s,0,min(t,l)));
end
end