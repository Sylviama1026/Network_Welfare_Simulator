function m = myFunAll(k, l, I, L, x, y, c, r)
    m = 0.5*exp(-I*k)/(0.5*exp(-I*k)+0.5)*(x+y-L/(r+L)*y*(1-exp((r+L)*k)/exp((r+L)*l)))-c;
end