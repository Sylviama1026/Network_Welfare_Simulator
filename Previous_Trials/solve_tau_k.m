%tau k
syms k l 
eqn = 0.5*exp(-1000*k)/(0.5*exp(-1000*k)+0.5)*(3-990/991*(1-exp(991*k)/exp(991*l)))-1 == 0;
eqn1 = subs(eqn,l,1);
S1 = solve(eqn1,k,'ReturnConditions',true);
S1.k;
S1.parameters;
S1.conditions;

S = solve(eqn,k,'ReturnConditions',true);
S.k;
S.parameters;
S.conditions;

eqn1 = subs(eqn,l,1);
S_vpa = vpasolve(eqn1,k);

%vpasolve: for loop: l val to solve tau k
l_para = 0:0.05:1;
S_vpa_all = zeros(1,length(l_para));
for i=1:length(l_para)
    disp(l_para(i))
    syms k l 
    eqn = 0.5*exp(-1000*k)/(0.5*exp(-1000*k)+0.5)*(3-990/991*(1-exp(991*k)/exp(991*l)))-1 == 0;
    eqn = subs(eqn,l,l_para(i))
    S_vpa_all(i) = vpasolve(eqn,k);
end
S_vpa_all
plot([S_vpa_all])

%fsolve: solve_tau_k
l = 0;
x0 = 0;
options = optimoptions('fsolve','Display','off');
k = fsolve(@(k)myFun(k,l),x0,options)

l_para = 0:0.05:1;
k_fsolve_all = zeros(1,length(l_para));
for i=1:length(l_para)
    disp(l_para(i))
    l = l_para(i);
    x0 = 0.001; %initial k=0
    options = optimoptions('fsolve','Display','off');
    k_fsolve_all(i) = fsolve(@(k)myFun(k,l),x0,options); %see myFun.m
end
k_fsolve_all %k at diff l
plot([k_fsolve_all])




