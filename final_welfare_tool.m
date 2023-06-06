%Required final_solver.m, final_V.m in the same directory

%INPUT HERE
m0 = [0, 0];        % initial guess of tau
options = optimoptions('fsolve','Display','iter');
p0 = 0.45;          %prior belief
x = 2;
c = 1;
r = 1;
y = (x-c)/r;

I = 1000;
K_all = [1, 2, 5, 10, 20, 30, 40, 70, 100]; %Modify here to adjust density!
L_all = I-K_all;
%END OF INPUT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%RUN BELOW

%solve tau_k and tau_l
tau_k_all = zeros(1,length(K_all));
tau_l_all = zeros(1,length(K_all));

parfor i=1:length(K_all)                    %solve tau in diff K parallely
    disp(K_all(i))                          %print out current K 
    L = L_all(i);
    [k, l] = fsolve(@(m) final_solver(m(1), m(2), I, L, x, y, c, r, p0), m0, options);
    tau_k_all(i) = k(2);
    tau_l_all(i) = l(2);
end

%print tau_k and tau_l results for each K
disp(K_all);
disp(tau_k_all);
disp(tau_l_all);


%get welfare benchmark V*
benchmark = repelem((p0*(x+y)-c),length(K_all)); %repeat V* for length(K) times
V_all = zeros(1,length(K_all));

%solve V with diff K parallely
parfor i=1:length(K_all) 
    disp(K_all(i))                          %print out current K 
    L = L_all(i);
    l = tau_l_all(i);
    k = tau_k_all(i);
    V_all(i) = double(final_V(l, k, I, L, x, c, r, p0));
end

%plot welfare with diff K
x1 = K_all;
y1 = V_all;               %V_all is same for all K if tau_l<tau_k always

figure;

scatter(x1,y1,40,'filled');                 %plot K vs V
ylim([0 0.6]);                              %adjust y-axis limit
hold on;
plot(x1,benchmark,'r--','LineWidth',1);     %plot V*

legend('V','V_{benchmark}');
xlabel('K');
ylabel('Welfare:V');
title('Plot of welfare for different K');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OPTIONAL

%plot B_t with diff K, required f_B.m
t_para = 0:0.05:2;
j = 1;          %Modify Here!! index of K
L = L_all(j);
l = tau_l_all(j);
k = tau_k_all(j);
f_B_val = zeros(1,length(t_para));

for i = 1:length(t_para)
    disp(i)
    t = t_para(i);
    disp(t)
    f_B_val(i) = f_B(t, k, l, I, L);
end

x1 = t_para;
y1 = f_B_val;

figure;
plot(x1,y1,'b-','LineWidth',2);
legend('B_t');
xlabel('t');
ylabel('B_t');
title(sprintf('Plot of B_t for K=%d', I-L));
ylim([0 10])

