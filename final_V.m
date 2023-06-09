% Store welfare as a function of K. 
%%% It will be called by final_wrapper_V()

function V=final_V(l, k, I, L, x, c, r, p0)
    if l<k
        B_l=(I-L)*l;
    else
        syms s;
        B_l = (I-L)*k-log(1-int((L-1)*exp(-(L-1)*s)*(1-exp(-(I-L)*(l-max(s,k)))),s,0,l));
    end
    V = (p0*x-c)/r + exp(-r*l)*(p0*exp(-B_l-l)*(x-c)-(1-p0)*c*(r-1)/r);
end