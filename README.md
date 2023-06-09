# Network_Welfare_Simulator
This MATLAB simulator can generate welfare and social information plots for different network density in Core-Periphery Social Network, which helps to identity the best social network density for information diffusion.

## Introduction
Innovations are key drivers of long-term economic growth, so it is essential to understand how they spread across society. Generally, people have two ways of gathering information: individual experimentation vs. social learning. If there is no social network and individual has to gain every piece of information through their own experiment, it would be time-consuming and lead to slow economic development. However, if we rely too much on social networks, it would crowd out new information generation and new trials. Therefore, it is important to find the best social network density for innovation diffusion and our simulator can help to identify such optimal density using math modeling and microeconomics theories. 

## Usage: Compute and Plot Welfare
The main tool is `final_wrapper_V()`. User has to put `final_V.m` and `final_solver.m` to the same directory of `final_wrapper_V.m`. Optimization Toolbox and Parallel Computing Toolbox are required to be installed in MATLAB before running `final_wrapper_V()`. 

The input parameters of `final_wrapper_V()` are:

- `I`: A large integer indicated the total number of people(nodes or agents) in the network.
- `K_all`: A 1xn vector of integers that are smaller than I, indicated the total number of core agents in the network. `L_all` will automatically be `I-K_all`. `n` can be set by users according the number of different K values one wants to try. 
- `x`: A single number, indicated the payoff received by agent’s own successes 
- `c`: A single number, indicated the cost of an agent’s private efforts to generate successes
- `r`: A single number, indicated the discounted rate of future benefits
- `p0`: A single number between 0 and 1, indicated the prior of belief for success in all agents at t=0.
- `m0`: A 1x2 vector, indicated the initial guess of the cutoff time $\tau$ for core and peripheral agents.
- `ncores`: A single number, indicated the number of cores used in parallel computing.

The output of `final_wrapper_V()` is 
- a plot of welfare for different K
- `V_benchmark`: the welfare benchmark in theories calculated by $p0*(x+y)-c$, printed out in the Command Window
- `K*`: the expected optimal density in theories calculated by solving $p0*(x+\frac{r}{r+k}*y)=c$, printed out in the Command Window
- a nx5 table which includes:
  - `K`: This is the row name of the table which indicates the number of core agents(K) used in each lines of results.
  - `tau_k`: $\tau_k$ the cutoff time of core agents in the network
  - `tau_l`: $\tau_l$ the cutoff time of peripheral agents in the network
  - `V`: the expected social welfare at each K
  - `B_inf`: the asymptotic information at each K

## Usage: Compute and Plot Total Information Across Time(Learning Curve)
The tool is `final_wrapper_B()`. User has to put `f_B.m` to the same directory as `final_wrapper_B.m`. $\tau_k$ and $\tau_l$ must have been solved by `final_wrapper_V()` to be input of this function. 

The input parameters of `final_wrapper_B()` are:

- `t_para`: A 1xm vector indicated the stepsize and range of time for computing the total information. `m` can be set by the user.
- `I`: A large integer indicated the total number of people(nodes or agents) in the network.
- `K_all`: A 1xn vector of integers that are smaller than I, indicated the total number of core agents in the network. `L_all` will automatically be `I-K_all`. `n` can be set by the user according the number of different K values one wants to try. 
- `tau_l_all`: A 1xn vector with the same length as `K_all`. $\tau_k$ the cutoff time of core agents in the network, which can be get from the output of `final_wrapper_V()`
- `tau_k_all`: A 1xn vector with the same length as `K_all`, $\tau_l$ the cutoff time of peripheral agents in the network, which can be get from the output of `final_wrapper_V()`

The output of `final_wrapper_B()` is learning curve plots at each K and `T_B`, a length(K_all) x length(t_para) matrix which includes:

- `B_t`: A nxm matrix stored total information at each K(each row) and time(each column). To check out the exact value of B, type `T_B(4,:)` to see the value of B_t when `K=K_all(4)=10` given we set `K_all=[1, 2, 5, 10, 20, 30, 40, 70, 100]`

## Major Files
For usage:
- `final_wrapper_V.m`: the wrapper function that call `final_V.m` and `final_solver.m` to solve welfare $V$, $\tau_k$, and $\tau_l$, and plot welfare across different K.
- `final_wrapper_B.m`: the wrapper function that call `f_B.m` to solve total information $B$ and plot $B$ across time(=t_para). One need to solve $\tau_k$ and $\tau_l$ before running this. 
- `final_solver.m`: store the indffierence conditions for core and peripheral agents respectively. It will be called by final_wrapper_V using `fsolve()` to solve $\tau_l$ and $\tau_k$ with parameters $I$, $L(=I-K)$, $x$, $y(=\frac{x-c}{r})$, $c$, $r$, $p0$
- `final_V.m`: store welfare as a function of K. It will be called by `final_wrapper_V` with parameters $\tau_l$, $\tau_k$, $I$, $L(=I-K)$, $x$, $c$, $r$, $p0$
- `f_B.m`: store total information as a function of time and K. It will be called by `final_wrapper_B` with parameters $t$, $\tau_k$, $\tau_l$, $I$, $L(=I-K)$

For illustrations and customizations:
- `final_example.m`: an illustration of how to use `final_wrapper_V()` to compute cutoff time $\tau$ and generate welfare plot and how to use `final_wrapper_B()` to compute total information across time for each K given by the user. 
- `final_tool_all.m`: expand the wrapper function `final_wrapper_V()` and `final_wrapper_B()`. It shows the entire workflow and can be used to generate partial output and customize plots as needed.


## Other Folders

### Previous_Trials
These are previous versions of the simulator, just for future reference. Files start with `f_` or `my` are functions for V and B, starts with `graph` are for plotting V and B, starts with `plot` are for plotting the intersection of $\tau_k$ and $\tau_l$(where the mat files starts with `l_fsolve_all_` are the plotting data stored for K=100 and 10), and files starts with `solve_` are for solving $\tau_k$ and $\tau_l$. Some of the previous simulator hard coded `p0=0.5`. `Monogamy.m` and `Poisson.m` are for Professor Meyer-ter-Vehn's talk about Epidemic Graph on May 8th.

### Papers_Presentations
This folder includes presentation slides at each stage of this project for 1-1 meeting with Professor Meyer-ter-Vehn, Board of Vistors Meeting at Economics Department, and UCLA Undergraduate Research Week. Also, it includes the a summary doc of the theoretical paper that the simulator is based on for my own purpose. 
