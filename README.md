# Network_Welfare_Simulator
This MATLAB simulator can generate welfare and social information plots for different network density in Core-Periphery Social Network, which helps to identity the best social network density for information diffusion.

## Introduction
Innovations are key drivers of long-term economic growth, so it is essential to understand how they spread across society. Generally, people have two ways of gathering information: individual experimentation vs. social learning. If there is no social network and individual has to gain every piece of information through their own experiment, it would be time-consuming and lead to slow economic development. However, if we rely too much on social networks, it would crowd out new information generation and new trials. Therefore, it is important to find the best social network density for innovation diffusion and our simulator can help to identify such optimal density using math modeling and microeconomics theories. 

## Usage
The main tool is `final_wrapper_V()`. User has to put `final_V.m` and `final_solver.m` in the same directory when running `final_wrapper_V()`. Optimization Toolbox and Parallel Computing Toolbox are required to be installed in MATLAB before running `final_wrapper_V()`. 

The input parameters of `final_wrapper_V()` are:

- `I`: A large integer indicated the total number of people(nodes) in the network.
- `K_all`: A 1xn vector of integers that are smaller than I, indicated the total number of core agents in the network. `L_all` will automatically be `I-K_all`. `n` can be set by users according the number of different K values one wants to try. 
- `x`: A single number, indicated the payoff received by agent’s own successes 
- `c`: A single number, indicated the cost of an agent’s private efforts to generate successes
- `r`: A single number, indicated the discounted rate of future benefits
- `p0`: A single number between 0 and 1, indicated the prior of belief for success in all agents at t=0.
- `m0`: A 1x2 vector, indicated the initial guess of the cutoff time $\tau$ for core and peripheral agents.
- `ncores`: A single number, indicated the number of cores used in parallel computing.

The output of `final_wrapper_V()` is a table which includes:

- `K_all`: This is the row name of the table which indicates the number of core agents(K) used in each lines of results.
- `tau_k_all`: $\tau_k$ the cutoff time of core agents in the network
- `tau_l_all`: $\tau_l$ the cutoff time of peripheral agents in the network
- `V_all`: the expected social welfare at the corresponding K
- `benchmark`: the social welfare benchmark 

## Major Files
- `final_wrapper_V.m`: the wrapper function that call `final_V.m` and `final_solver.m` to solve welfare, $\tau_k$, and $\tau_l$, and plot welfare across different K.
- `final_example.m`: an illustration of how to use `final_wrapper_V()` to compute cutoff time $\tau$ and generate welfare plot for each K given by the user.
- `final_tool_all.m`: expand the wrapper function `final_wrapper_V()`. It can be used to customize function output as needed.
- `final_solver.m`: compute $\tau_l$ and $\tau_k$ by solving indffierence conditions for core and peripheral agents respectively, with parameters $I$, $L(=I-K)$, $x$, $y(=\frac{x-c}{r})$, $c$, $r$, $p0$
- `final_V.m`: compute welfare as a function of K with parameters $\tau_l$, $\tau_k$, $I$, $L(=I-K)$, $x$, $c$, $r$, $p0$

