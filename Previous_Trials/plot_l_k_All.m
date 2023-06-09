%value adjustable
m0 = [0, 0]; % initial guess
options = optimoptions('fsolve','Display','iter');
I = 1000;
L = 990; %Modify here!
x = 2;
c = 1;
r = 1;
y = (x-c)/r;
[k, l] = fsolve(@(m) myBothAll(m(1), m(2), I, L, x, y, c, r), m0, options);

%fsolve: solve_tau_k, myFunAll
l_para =  0:0.0001:0.01;
k_fsolve_all = zeros(1,length(l_para));

% Start parallel pool
parpool('local',4);

parfor i=1:length(l_para)
    disp(l_para(i))
    l = l_para(i);
    x0 = 0.001; %initial k=0
    options = optimoptions('fsolve','Display','off');
    k_fsolve_all(i) = fsolve(@(k)myFunAll(k,l, I, L, x, y, c, r),x0,options); %see myFunAll.m
end

k_fsolve_all %k at diff l

% Close the parallel pool
delete(gcp);


%fsolve: solve_tau_l, myEquationAll
k_para = 0:0.0001:0.01;
l_fsolve_all = zeros(1,length(k_para));

% Start parallel pool
parpool('local',4);

parfor i=1:length(k_para)
    disp(k_para(i))
    k = k_para(i);
    x0 = 0; %initial l=0
    options = optimoptions('fsolve','Display','off');
    l_fsolve_all(i) = fsolve(@(l)double(myEquationAll(k,l, I, L, x, y, c, r)),x0,options); %see myEquationAll.m
end

l_fsolve_all %l at diff k
% Close the parallel pool
delete(gcp);

%plot([k_fsolve_all])
%plot([l_fsolve_all])

x1 = l_para;
y1 = k_fsolve_all;
x2 = l_fsolve_all;
y2 = k_para;

figure;
plot(x1,y1,'b-','LineWidth',2);
hold on;
plot(x1, x1);
hold on;
plot(x2,y2,'r-','LineWidth',2);
legend('tau_l as input','tau_k as input');
xlabel('tau_l');
ylabel('tau_k');
title('Plot of tau_l and tau_k');