%To compute and plot total information across t (B_t) at different K
%%%`f_B.m` must be in the same directory of this file. 
%%% One need to solve tau_k and tau_l before running this. 

function T_B=final_wrapper_B(t_para, I, K_all, tau_l_all, tau_k_all)
    T_B = zeros(length(K_all),length(t_para));
    
    %generate one B_t plot for each K
    for j = 1:length(K_all)
        disp(K_all(j));                     %print out current K
        L_all = I-K_all;
        L = L_all(j);
        l = tau_l_all(j);
        k = tau_k_all(j);
        f_B_val = zeros(1,length(t_para));
        
        for i = 1:length(t_para)
            t = t_para(i);
            disp(t);
            f_B_val(i) = f_B(t, k, l, I, L); %comput B_t using f_B.m
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
       
        T_B(j,:) = f_B_val;
    end 
    
end