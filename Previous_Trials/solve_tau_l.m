%tau l


%t<tau_k
syms  l t
eqn = 0.5*exp(-11*l)/(0.5*exp(-11*l)+0.5)*(2 + int(exp(-11*t+11*l),t,l,inf) )-1 == 0;
S = solve(eqn,l,'ReturnConditions',true);
S.l;
S.parameters;
S.conditions;

%t>tau_k: unable to solve symbolically, vpasolve treats s and t as outside
syms  l t k s

eqn_B = 10*k-log(1-int(989*exp(-989*s)*(1-exp(-10*(t-max(s,k)))),s,0,min(t,l)));
eqn1 = 0.5*exp(-subs(eqn_B,t,l)-l)/(0.5*exp(-subs(eqn_B,t,l)-l)+0.5)*(2 + int(exp(-t+l-eqn_B+subs(eqn_B,t,l)),t,l,inf) )-1 == 0;
eqn1_val = subs(eqn1,k,0.1);
S1 = vpasolve(eqn1_val,l);
S1.l;
S1.parameters;
S1.conditions;

myEquation(1,1)

%fsolve: myEquation
k = 0;
x0 = 0;
options = optimoptions('fsolve','Display','off');
l = fsolve(@(l)double(myEquation(k,l)),x0,options);

k_para = 0:0.05:1;
l_fsolve_all = zeros(1,length(k_para));
for i=1:length(k_para)
    disp(k_para(i))
    k = k_para(i);
    x0 = 0; %initial l=0
    options = optimoptions('fsolve','Display','off');
    l_fsolve_all(i) = fsolve(@(l)double(myEquation(k,l)),x0,options); %see myEquation.m
end
l_fsolve_all %l at diff k
plot([l_fsolve_all])



