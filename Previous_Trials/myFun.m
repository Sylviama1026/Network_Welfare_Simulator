
function y = myFun(k, l)
y = 0.5*exp(-1000*k)/(0.5*exp(-1000*k)+0.5)*(3-990/991*(1-exp(991*k)/exp(991*l)))-1;
end