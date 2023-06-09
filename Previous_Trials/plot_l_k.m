%fsolve: solve_tau_k, myFun
l_para = 0:0.0001:0.009;
k_fsolve_all = zeros(1,length(l_para));
for i=1:length(l_para)
    disp(l_para(i))
    l = l_para(i);
    x0 = 0.001; %initial k=0
    options = optimoptions('fsolve','Display','off');
    k_fsolve_all(i) = fsolve(@(k)myFun(k,l),x0,options); %see myFun.m
end
k_fsolve_all %k at diff l

%fsolve: solve_tau_l, myEquation
k_para = 0:0.005:0.06;
l_fsolve_all = zeros(1,length(k_para));
for i=1:length(k_para)
    disp(k_para(i))
    k = k_para(i);
    x0 = 0; %initial l=0
    options = optimoptions('fsolve','Display','off');
    l_fsolve_all(i) = fsolve(@(l)double(myEquation(k,l)),x0,options); %see myEquation.m
end
l_fsolve_all %l at diff k

plot([k_fsolve_all])
plot([l_fsolve_all])

x1 = l_para;
y1 = k_fsolve_all;
x2 = l_fsolve_all;
y2 = k_para;

figure;
plot(x1,y1,'b-','LineWidth',2);
hold on;
plot(x2,y2,'r--','LineWidth',2);
legend('tau_l as input','tau_k as input');
xlabel('tau_l');
ylabel('tau_k');
title('Plot of tau_l and tau_k');
