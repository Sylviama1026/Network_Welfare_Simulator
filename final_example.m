%Example of running final_wrapper_V() and final_wrapper_B()
%%% Required final_solver.m, final_V.m, f_B.m, final_wrapper_V.m
%%% and final_wrapper_B.m in the same directory

%INPUT HERE
I = 1000;          %total number of agents
K_all = [1, 2, 5, 10, 20, 30, 40, 70, 100]; %number of core agents
x = 2;
c = 1;
r = 1;
p0 = 0.45;         %prior belief
m0 = [0, 0];       %initial guess of tau
ncores = 4;        %number of cpu cores used in parallel computing

t_para = [0:0.05:0.2,0.2:0.1:2];  %t range and stepsize for B_t plot
%END OF INPUT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%RUN BELOW

%For welfare V: run final_wrapper_V()

T = final_wrapper_V(I, K_all, x, c, r, p0, m0, ncores);
T                  %output table




%For information B: run final_wrapper_B()
%Note: Need to get T from above before running this

tau_l_all = transpose(T.tau_l);
tau_k_all = transpose(T.tau_k); 
T_B = final_wrapper_B(t_para, I, K_all, tau_l_all, tau_k_all);
T_B(1,:)           %get values of B_t for K_all(1)(i.e. when K=1)
