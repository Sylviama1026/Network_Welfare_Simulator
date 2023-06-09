%Expand final_wrapper_V() and final_wrapper_B()
%useful to generate partial results or to customize plot
%Required final_solver.m, final_V.m, f_B.m in the same directory of this
%file

%INPUT HERE
m0 = [0, 0];        % initial guess of tau
options = optimoptions('fsolve','Display','iter');
p0 = 0.5;          %prior belief
x = 2;
c = 1;
r = 1;
y = (x-c)/r;

I = 1000;
K_all = [1, 2, 5, 10, 20, 30, 40, 70, 100]; %Modify here to adjust density!
L_all = I-K_all;
%END OF INPUT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%RUN BELOW: same as final_wrapper_V.m

%solve tau_k and tau_l
    tau_k_all = zeros(1,length(K_all));
    tau_l_all = zeros(1,length(K_all));
    
    % Start parallel pool
    parpool('local',ncores);

    parfor i=1:length(K_all)                    %solve tau in diff K parallely
        disp(K_all(i))                          %print out current K 
        L = L_all(i);
        [tau, ~] = fsolve(@(m) final_solver(m(1), m(2), I, L, x, y, c, r, p0), m0, options);
        %force tau_k=0 if we get a negative root since we can't add contraints in fsolve
        %another solution is to compute tau_l again after fixing tau_k=0
        %but this solution may take too long to run
        if(tau(1)<0)                            
            tau_k_all(i) = 0;
        else
            tau_k_all(i) = tau(1);
        end
        tau_l_all(i) = tau(2);
    end


    %get welfare benchmark V*
    benchmark = repelem((p0*(x+y)-c),length(K_all)); %repeat V* for length(K) times
    
    V_all = zeros(1,length(K_all));
    B_inf_all = zeros(1,length(K_all));

    %compute V and B_inf with diff K parallely
    parfor i=1:length(K_all) 
        disp(K_all(i))                          %print out current K 
        L = L_all(i);
        l = tau_l_all(i);
        k = tau_k_all(i);
        V_all(i) = double(final_V(l, k, I, L, x, c, r, p0));
        B_inf_all(i) = k*(I-L)+l*L;
    end
    
    delete(gcp);              %stop parallel pool

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
    
    
    %print results
    disp(['V_benchmark = ',num2str(p0*(x+y)-c)]);
    disp(['K* = ',num2str((r*y)/(c/p0-x)-r)]);
    
    T = table;
    T.K = transpose(K_all);
    T.tau_k = transpose(tau_k_all);
    T.tau_l = transpose(tau_l_all);
    T.V = transpose(V_all);
    T.B_inf = transpose(B_inf_all);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot B_t with one K specified by user

%INPUT
t_para = 0:0.05:2;  %t range and stepsize for B_t plot
j = 1;              %index of K in K_all(EX: K(1)=1, K(2)=2, K(3)=5, K(4)=10)
%END OF INPUT



%RUN BELOW: same as final_wrapper_B.m
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

