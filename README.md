# Network_Welfare_Simulator
This MATLAB simulator can generate welfare and social information plots for different network density in Core-Periphery Social Network, which helps to identity the best social network density for information diffusion.

## Introduction
Innovations are key drivers of long-term economic growth, so it is essential to understand how they spread across society. Generally, people have two ways of gathering information: individual experimentation vs. social learning. If there is no social network and individual has to gain every piece of information through their own experiment, it would be time-consuming and lead to slow economic development. However, if we rely too much on social networks, it would crowd out new information generation and new trials. Therefore, it is important to find the best social network density for innovation diffusion and our simulator can help to identify such optimal density using math modeling and microeconomics theories. 

## Usage
The main tool is `final_wrapper_V()` located in `final_wrapper_V.m`. User has to put `final_V.m` and `final_solver.m` in the same working directory when running `final_wrapper_V()`.  

The input parameters of `final_wrapper_V()` are:

- `I`: A large integer indicated the total number of people(nodes) in the network.
- `K_all`: A 1xn vector of integers that are smaller than I, indicated the total number of core members in the network. `L_all` will automatically be `I-K_all`. `n` can be set by users according the number of different K values one wants to try. 
- `x`: A single number, indicated the payoff received by agent’s own successes 
- `c`: A single number, indicated the cost of an agent’s private efforts to generate successes
- `r`: A single number, indicated the discounted rate of future benefits
- `p0`: A single number between 0 and 1, indicated the prior of belief for success in all agents at t=0.
- `m0`: A 1x2 vector, indicated the initial guess of the cutoff time $\tau$ for core and peripheral members.

The output of `final_wrapper_V()` is a table which includes:

- `K_all`: This is the row name of the table which indicates the number of core members(K) used in each lines of results.
- `tau_k_all`: the cutoff time of core members in the network
- `tau_l_all`:  the cutoff time of peripheral members in the network
- `V_all`: the expected social welfare
- `benchmark`: the social welfare benchmark 

## Customization
Please check out `final_tool_all.m` to see the details code of the wrapper function above and customize the outputs as needed. 

